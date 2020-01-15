class ProductsController < ApplicationController

  def index
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
