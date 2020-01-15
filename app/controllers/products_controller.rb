class ProductsController < ApplicationController

  def index
  end

  def new
  end
  
  def edit
    @product= Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to root_path, notice: '編集できませんでした'
    end  
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :shipping_charge, :shipping_method, :shipping_prefecture, :shipping_days, :price)
  end

  

end
