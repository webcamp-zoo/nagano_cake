class Customer::CustomersController < ApplicationController

    before_action :correct_customer, only: [:edit, :update, :hide, :withdrawal]

    def show
        @user = current_customer
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])#ユーザーの情報を特定する
    if @customer.update(customer_params)#更新する
           redirect_to customer_path(@customer.id)#,notice: 'You have updated user successfully.'
        else 
            render :edit
        end
    end

    def hide
        @customer = Customer.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        # @customer.update(is_deleted: false)
        #ログアウトさせる
        #reset_session
        # flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        #redirect_to root_path
    end
    
    def withdrawal
        @customer = Customer.find(params[:id])
        @customer.update(is_deleted: false)
        reset_session
        redirect_to root_path
    end
end

private

def correct_customer
    @customer = Customer.find(params[:id])
        if @customer != current_customer
            redirect_back(fallback_location:customer_customers_hide_path)#多分、この記述で直前のぺージににリダイレクトできるはず
        end
end