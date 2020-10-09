class Customer::ProductsController < ApplicationController

	def top
	end

	def about
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end

	def index
    	@products = Product.all.page(params[:page]).per(8)
    	@tax = 1.1
    	@genres = ProductGenre.all
	end
end
