class ProductsController < ApplicationController

  def index

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
  
end

end
