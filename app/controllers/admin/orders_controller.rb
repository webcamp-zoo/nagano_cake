class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@orders = Order.all
		@customers = Customer.all
	end

		def today_order_index
			now = Time.current
		    @orders = Order.where(created_at: now.all_day)
			@customers = Customer.all
		    render :index
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
