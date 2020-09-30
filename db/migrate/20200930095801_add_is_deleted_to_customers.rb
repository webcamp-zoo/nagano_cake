class AddIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_deleted, :boolean, default: true, null: false
  end
end
