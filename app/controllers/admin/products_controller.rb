class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.all
    now = Time.current
    @today_orders = Order.where(created_at: now.all_day)
  end

  def new
    @product = Product.new
    @genres = ProductGenre.where(is_active: true)
  end

  def create
    @product = Product.new(product_params)
    @genres = ProductGenre.where(is_active: true)
    if @product.save
      redirect_to admin_products_path, notice: "You have created new genre successfully."
    else
      render :new
    end
  end

  def index
  	@products = Product.all
  end

  def show
  	@tax = 1.1
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  	@genres = ProductGenre.where(is_active: true)
  end

  def update
  	@product = Product.find(params[:id])
    @genres = ProductGenre.where(is_active: true)
  	if @product.update(product_params)
      redirect_to admin_products_path, notice: "You have updated product successfully."
    else
      render "edit"
    end
  end


 private

  def product_params
    params.require(:product).permit(:name, :image, :introduction,:product_genre_id, :price, :is_active)
  end

end
