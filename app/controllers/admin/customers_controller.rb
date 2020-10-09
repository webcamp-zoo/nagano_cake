class Admin::CustomersController < ApplicationController


    before_action :authenticate_admin!

    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
    	@customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer), notice: "You have updated book successfully."
        else
        redirect_to request.referer
        end
    end

    private
    def customer_params
      params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
    end

end
