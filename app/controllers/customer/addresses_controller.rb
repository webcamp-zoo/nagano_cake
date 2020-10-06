class Customer::AddressesController < ApplicationController

	before_action :authenticate_customer!

	def index
		@address = Address.new
		@addresses = Address.all
	end

	def create
		@address = Address.new(address_params)
		@address.customer_id = current_customer.id
        if @address.save
          redirect_to request.referer, notice: "You have created address successfully."
        else
          @addresses = Address.all
          redirect_to request.referer
        end
	end

	def destroy
		@address = Address.find(params[:id])
        @address.destroy
        redirect_to request.referer
	end

	def edit
        @address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
        redirect_to customer_addresses_path(@address), notice: "You have updated book successfully."
        else
        redirect_to request.referer
        end
	end

	private

    def address_params
        params.require(:address).permit(:name, :postal_code, :address)
    end

end


