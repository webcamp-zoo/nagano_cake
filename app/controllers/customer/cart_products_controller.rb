class Customer::CartProductsController < ApplicationController

	before_action :authenticate_customer!

	def index
		@cart_products = current_customer.cart_products
	end

	def create
		cart_product = CartProduct.new(cart_product_params) #product_idとquantityはform_forで取得済
		cart_product.customer = current_customer
		if CartProduct.find_by(product_id: cart_product.product_id, customer_id: current_customer.id) #既にそのユーザーがこの商品をカートに入れていたら
			existing_cart_product = CartProduct.find_by(product_id: cart_product.product_id, customer_id: current_customer.id)
			existing_cart_product.quantity += cart_product.quantity #quantityを既存のquantityに足して
			existing_cart_product.save #保存する
		else #まだそのユーザーがこの商品を登録してなかったら
			cart_product.save #新しくレコードを作る
		end
			redirect_to customer_cart_products_path
	end

	def update
		cart_product = CartProduct.find(params[:id]) #変更前の数量のまま
		cart_product.update(cart_product_params)
		redirect_to customer_cart_products_path
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to customer_cart_products_path
	end

	def destroy_all
		@cart_products = current_customer.cart_products
		@cart_products.destroy_all
		redirect_to customer_cart_products_path
	end

	private
	def cart_product_params
		params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
	end
end
