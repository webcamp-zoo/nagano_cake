class Admin::ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create

	end

end



  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :tax_out_price, :is_sale)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end