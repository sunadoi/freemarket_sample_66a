class ProductsController < ApplicationController

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
    @product = Product.includes([:photos, :brand, :category, :seller]).find(params[:id])
    @seller_products = @product.seller.user.products.limit(6)
    eval = @product.seller.user.sellers.map{ |e| e[:evaluate] }
    @good = eval.count(1)
    @ok = eval.count(2)
    @bad = eval.count(3)
  end

end
