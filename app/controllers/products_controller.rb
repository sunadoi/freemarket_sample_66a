class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :index]

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
  end
  
  def show
    @seller_products = @product.seller.user.products.order(id: "DESC").first(6)
    @good = Seller.where(user_id: @product.seller.user.id, evaluate: 1).count
    @ok = Seller.where(user_id: @product.seller.user.id, evaluate: 2).count
    @bad = Seller.where(user_id: @product.seller.user.id, evaluate: 3).count
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
