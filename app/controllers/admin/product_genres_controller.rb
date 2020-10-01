class Admin::ProductGenresController < ApplicationController
	def index
		@product_genre = ProductGenre.new
    	@product_genres = ProductGenre.all
	end

	def create

	end

	def edit

	end

	def update

	end

	private

	def product_genre_params
		 params.require(:product_genre).permit(:name, :is_valid)
	end
end


def create
    @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admin_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
      render :index and return
    end
  end

  def show
    @products = Product.all.all.page(params[:page]).per(10)
    @genre = Genre.find(params[:id])
    @genres = @genre.products.order(created_at: :desc).all.page(params[:page]).per(5)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admin_genres_path
      if @genre.is_valid == false
        @genre.products.each do |product|
          product.is_sale = false
          product.save
        end
      end
    else
       render :edit and return
    end
  end

