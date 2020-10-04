class RemoveProductsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :products, :boolean
  end
end
