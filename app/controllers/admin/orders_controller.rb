class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
		@customers = Customer.all
		@order_products = OrderProduct.all
	end

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
		@address = Order.find(params[:id]).order_address
	end

	def update
		@order = Order.find(params[:id])

		if @order.update(order_params)
		   redirect_to admin_order_path(@order), notice: "注文ステータスを変更しました"
		else
		   render "show"
		end
	end


	private

	def order_params
		  params.require(:order).permit(:status)
	end

end
