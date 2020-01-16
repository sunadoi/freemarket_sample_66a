class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :index]
  include ApplicationHelper

  def index



      @ladys = Product.where(category_id:1..190).first(10)
      @mens = Product.where(category_id:200..345).first(10)
      @appliances = Product.where(category_id:898..983).first(10)
      @toys = Product.where(category_id:685..797).first(10)

      @chanels = Product.where(brand_id:1).first(10)
      @coachs = Product.where(brand_id:2).first(10)
      @louisvuittons = Product.where(brand_id:3).first(10)
      @guccis = Product.where(brand_id:4).first(10)

  end

  def new
    @product = Product.new
    @product.photos.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      render :new
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
private

def product_params
  params.require(:product).permit(:name, :description, photos_attributes: [:image]).merge(user_id: 1, category_id: params[:product][:category_id].to_i, brand_id: params[:product][:brand_id].to_i, size: params[:product][:size].to_i, condition: params[:product][:condition].to_i, shipping_charge: params[:product][:shipping_charge].to_i, shipping_method: params[:product][:shippig_method].to_i, shipping_prefecture: params[:product][:shipping_prefecture].to_i, shipping_days: params[:product][:shipping_days].to_i, brand_id: params[:product][:brand_id].to_i, price: params[:product][:price].to_i, progress: params[:product][:progress].to_i)
  
  def show
    @seller_products = @product.seller.user.products.limit(6)
    eval = @product.seller.user.sellers.map{ |e| e[:evaluate] }
    @good = eval.count(1)
    @ok = eval.count(2)
    @bad = eval.count(3)
  end

  def destroy
    if @product.destroy!
      redirect_to controller: 'users', action: 'show'
    else
      redirect_to action: 'show', alert: '削除できませんでした'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end

end
