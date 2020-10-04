class Customer::ProductsController < ApplicationController

	def top
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end

end
