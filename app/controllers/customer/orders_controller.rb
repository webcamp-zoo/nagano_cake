class Customer::OrdersController < ApplicationController

    before_action :authenticate_customer!


    def index
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products
    end

    def new
        @order = Order.new
        @addresses = Address.where(customer_id: current_customer.id)
    end

    def log #ここではまだ@orderの中にパラメーターを入れているだけで、セーブはしていない。
        @order = Order.new
        if "address1"== params[:addresses]
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.full_name
        elsif "address2"== params[:addresses]
            @order.postal_code = Address.find(params[:address_id]).postal_code
            @order.address = Address.find(params[:address_id]).address
            @order.name = current_customer.full_name
        elsif "address3"== params[:addresses]
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

    def create #logページのhidden_fieldで送られてきた、情報をセーブする。
        order = Order.new(order_params)#ストロングパラメーターでカラムを入れているので、order_paramsを記述するだけでOK！
        order.save
        @cart_products.each do |cart_product|
            @order_product = OrderProduct.new(
                product_id: cart_product.product.id,
                order_id: order.id,
                quantity: cart_product.quantity,
                making_status: 0,
                taxed_price: 1)
            @order_product.save
            cart_product.destroy
        end
        redirect_to customer_orders_thanx_path

        if "address3"== params[:addresses]
            current_customer.address.create(address_params)
        end
    end

    def thanx
    end

    private
	def order_params
		params.permit(:customer_id, :payment_method, :total_price, :name, :address, :postal_code)#この中で指定したカラムがorder_paramsに入っていて、order_paramsを記述すると、入っている全てのカラムの情報を使う事ができる。


end
