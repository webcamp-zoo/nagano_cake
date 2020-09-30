class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :products, :genre_id 
      t.integer :products, :price
      t.string :products, :name
      t.string :products, :image_id
      t.text :products, :introduction
      t.boolean :products, :is_active, default: true
      t.timestamps
    end
  end
end
