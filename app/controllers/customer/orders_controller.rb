class Customer::OrdersController < ApplicationController

    def new
        @order = Order.new
        @addresses = Address.where(customer_id: current_customer.id)
    end

    def log
        @order = Order.new
        if "address1"== params[:addresses]
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.full_name
        elsif "address2"== params[:addresses]
            @order.postal_code = Address.find(params[:address_id]).postal_code
            @order.address = Address.find(params[:address_id]).address
            @order.name = current_customer.full_name
        else
            @order.postal_code = params[:postal_code]
            @order.address = params[:address]
            @order.name = params[:name]
        end

        if "クレジットカード" == params[:payment_method]
            @order.payment_method = 0
        else 
            @order.payment_method = 1
        end
        
        @cart_products = current_customer.cart_products

    end

    def create
        order = Order.new(order_params)
        order.save
        redirect_to customer_orders_thanx_path
    end

    def thanx

    end

    private
	def order_params
		params.permit(:customer_id, :payment_method, :total_price, :name, :address, :postal_code)
    end

end
