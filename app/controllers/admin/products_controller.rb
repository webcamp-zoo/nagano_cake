class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product) notice: "You have created new genre successfully."
    else
      redirect_to request.referer
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image_id, :introduction,
       :genre_id, :price, :is_active)
  end

end
