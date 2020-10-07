class ChangeDateDefaultToOrderProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :order_products, :making_status, from: nil, to: 0
  end
end
