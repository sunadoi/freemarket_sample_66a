class ProductsController < ApplicationController

  def index
  end

  def new
  end
  
  def show
    @product = Product.includes([:photos, :brand, :category]).find(params[:id])
    @products = Product.all
  end

end
