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
  end
  
  def show
    @seller_products = @product.seller.user.products.limit(6)
    eval = @product.seller.user.sellers.map{ |e| e[:evaluate] }
    @good = eval.count(1)
    @ok = eval.count(2)
    @bad = eval.count(3)
    current_user.id = 1
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
