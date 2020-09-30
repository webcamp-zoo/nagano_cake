class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :product_genres do |t|
      t.integer :name , default: 0
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
