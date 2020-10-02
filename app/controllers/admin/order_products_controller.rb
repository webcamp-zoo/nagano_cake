class Admin::OrderProductsController < ApplicationController
    def index
        @customers = Customer.all
    end
end
