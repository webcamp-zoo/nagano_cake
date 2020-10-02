class Admin::ProductGenresController < ApplicationController

  def index
    @genre = ProductGenre.new
    @genres = ProductGenre.all
  end

  def create
    @genre = ProductGenre.new(genre_params)
    if @genre.save
       redirect_to request.referer notice: "You have created new genre successfully."
    else
      # @genre = ProductGenre.new?
      # @genres = ProductGenre.all?
      redirect_to request.referer
    end
  end

  # def edit
  #   @genre = Genre.find(params[:id])
  # end

  # def update
  #   @genre = Genre.find(params[:id])
  #   if @genre.update(genre_params)
  #     flash[:success] = "ジャンルを変更しました"
  #     redirect_to admin_genres_path
  #     if @genre.is_valid == false
  #       @genre.products.each do |product|
  #         product.is_sale = false
  #         product.save
  #       end
  #     end
  #   else
  #      render :edit and return
  #   end
  # end

  private

  def genre_params
    params.require(:product_genre).permit(:name, :is_active)
  end

end
