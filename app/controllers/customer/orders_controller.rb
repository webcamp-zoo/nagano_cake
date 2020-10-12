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
        @order_product = OrderProduct.new
        @cart_products = current_customer.cart_products
        if "address1"== params[:addresses]
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.full_name
        elsif "address2"== params[:addresses]
            @order.postal_code = Address.find(params[:address_id]).postal_code
            @order.address = Address.find(params[:address_id]).address
            @order.name = Address.find(params[:address_id]).name
        else "address3"== params[:addresses]
            if  params[:postal_code] == "" || params[:address] == "" || params[:name] == ""
                redirect_to new_customer_order_path,notice: '郵便番号、住所、宛名を全て記入してください'
            end
            @order.postal_code = params[:postal_code]
            @order.address = params[:address]
            @order.name = params[:name]
        end
            #@address = Address.new
            # @address.postal_code = params[:postal_code]
            # @address.address = params[:address]
            # @address.address = params[:address]
            # @address.save
            Address.create(
                 postal_code: params[:postal_code],
                 address: params[:address],
                 name: params[:name],
                 customer_id: current_customer.id
             ) #入力された新しい住所をAddressモデルにレコードを作って保存する（Address.createの、createとは new + save のような物）


        # if  params[:postal_code] == "" || params[:address] == "" || params[:name] == ""
        #     redirect_to new_customer_order_path,notice: '郵便番号、住所、宛名を全て記入してください'
        # end

        if "クレジットカード" == params[:payment_method]
            @order.payment_method = 0
        else
            @order.payment_method = 1
        end
        @cart_products = current_customer.cart_products #current_customerに紐づくcart_productsモデルの情報を@cart_productsに入れる

    end

    def create #logページのhidden_fieldで送られてきた、情報をセーブする。
        order = Order.new(order_params)#ストロングパラメーターでカラムを入れているので、order_paramsを記述するだけでOK！
        if order.save
        @cart_products = current_customer.cart_products #current_customerに紐づくcart_productsモデルの情報を@cart_productsに入れる（書き方を額にすれば、逆の意味も作れる）。
            @cart_products.each do |cart_product|
            @order_product = OrderProduct.new(
                product_id: cart_product.product.id,
                order_id: order.id,
                quantity: cart_product.quantity,
                taxed_price: ((cart_product.product.price * 1.1).round(2)).ceil)
            @order_product.save
            cart_product.destroy
            end
        else
            render "new"
        end


        if "address3"== params[:new_address]
            new_address = Address.new(address_params)
            new_address.save(address_params)
        end
        redirect_to customer_orders_thanx_path

        end

    def thanx
    end

    private

      def order_params
          params.permit(:customer_id, :payment_method, :total_price, :name, :address, :postal_code)#この中で指定したカラムがorder_paramsに入っていて、order_paramsを記述すると、入っている全てのカラムの情報を使う事ができる。
    end

    def address_params
       params.require(:address).permit(:customer_id, :name, :postal_code, :address)
    end
end


