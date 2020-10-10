class Admin::OrderProductsController < ApplicationController

	before_action :authenticate_admin!

    def update
  		@order_product = OrderProduct.find(params[:id])
		  if @order_product.update(order_product_params)
		    redirect_to admin_order_path(@order_product.order), notice: "制作ステータスを変更しました"
		  else
		     render "show"
		  end
  end


  private

  def order_product_params
		  params.require(:order_product).permit(:making_status)
	end

end
