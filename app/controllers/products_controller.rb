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
  
end
