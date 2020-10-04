class Customer::ProductsController < ApplicationController

	def top
	end

	def index
    	@products = Product.all
    	@tax = 1.1
    	@genres = ProductGenre.all
	end

	def show

	end

end
