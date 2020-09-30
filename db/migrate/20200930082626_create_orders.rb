class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :total_price
      t.integer :payment_method , defalut: 0
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :status , defalut: 0

      t.timestamps
    end
  end
end
