class Customer::ProductsController < ApplicationController

	before_action :genre

	def top
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
  	end

	def index
    	@tax = 1.1
    	if params[:product_genre_id]
	      # ProductGenreのデータベースのテーブルから一致するidを取得
	      genre = ProductGenre.find(params[:product_genre_id])
	      @title = genre.name
	      # category_idと紐づく投稿を取得
	      @products = genre.products.all
	      @count = @products.count
	    else
	      # 投稿すべてを取得
	      @title = "商品一覧"
	      @products = Product.all
	      @count = @products.count
	    end
	end

	private

	def genre
		@genres = ProductGenre.where(is_active: :true)
	end

end

