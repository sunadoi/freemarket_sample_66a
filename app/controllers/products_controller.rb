class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :index, :create, :get_category_children, :get_category_grandchildren]
  include ApplicationHelper
  before_action :set_ancestry, only: [:edit]
  before_action :ensure_login, except: [:index, :show]

  def index
    @ladys = Product.where(category_id:1..190, progress: 1).first(10)
    @mens = Product.where(category_id:200..345, progress: 1).first(10)
    @appliances = Product.where(category_id:898..983, progress: 1).first(10)
    @toys = Product.where(category_id:685..797, progress: 1).first(10)

    @chanels = Product.where(brand_id:1, progress: 1).first(10)
    @coachs = Product.where(brand_id:2, progress: 1).first(10)
    @louisvuittons = Product.where(brand_id:3, progress: 1).first(10)
    @guccis = Product.where(brand_id:4, progress: 1).first(10)
  end

  def new
    @product = Product.new
    @product.photos.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @seller = Seller.create(user_id: current_user.id, product_id: @product.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(params_update_product)
      redirect_to root_path
    else
      render :new
    end
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def show
    @seller_products = @product.user.products.order(id: "DESC").first(6)
    @good = Seller.where(user_id: @product.user.id, evaluate: 1).count
    @ok = Seller.where(user_id: @product.user.id, evaluate: 2).count
    @bad = Seller.where(user_id: @product.user.id, evaluate: 3).count
  end

  def destroy
    if @product.destroy!
      redirect_to controller: 'users', action: 'show'
    else
      redirect_to action: 'show', alert: '削除できませんでした'
    end
  end

  private

  def product_params

    params.require(:product).permit(:name, :description, photos_attributes: [:image]).merge(user_id: current_user.id, category_id: params[:category_id].to_i, brand_id: params[:product][:brand_id].to_i, size: params[:product][:size].to_i, condition: params[:product][:condition].to_i, shipping_charge: params[:product][:shipping_charge].to_i, shipping_method: params[:product][:shipping_method].to_i, shipping_prefecture: params[:product][:shipping_prefecture].to_i, shipping_days: params[:product][:shipping_days].to_i, brand_id: params[:product][:brand_id].to_i, price: params[:product][:price].to_i, progress: params[:product][:progress].to_i)

  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_ancestry
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def params_update_product
    params.require(:product).permit(:name, :description, photos_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, category_id: params[:category_id].to_i, brand_id: params[:product][:brand_id].to_i, size: params[:product][:size].to_i, condition: params[:product][:condition].to_i, shipping_charge: params[:product][:shipping_charge].to_i, shipping_method: params[:product][:shipping_method].to_i, shipping_prefecture: params[:product][:shipping_prefecture].to_i, shipping_days: params[:product][:shipping_days].to_i, brand_id: params[:product][:brand_id].to_i, price: params[:product][:price].to_i, progress: params[:product][:progress].to_i)
  end
end



