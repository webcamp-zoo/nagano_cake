class Customer::CustomersController < ApplicationController

    before_action :authenticate_customer!


    def show
        @customer = Customer.find(current_customer.id)
    end

    def edit
        @customer = Customer.find(current_customer.id)
    end

    def update
        @customer = Customer.find(current_customer.id)#ユーザーの情報を特定する
    if @customer.update(customer_params)#更新する
           redirect_to customer_customers_path(@customer.id)#,notice: 'You have updated user successfully.'
        else
            render :edit
        end
    end

    def hide
        @customer = Customer.find(current_customer.id)
    end

    def withdrawal
        @customer = Customer.find(current_customer.id)
        @customer.update(is_deleted: false)
        reset_session
        redirect_to customer_products_top_path
    end

    private
	def customer_params
		params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:phone_number)
	end
end
