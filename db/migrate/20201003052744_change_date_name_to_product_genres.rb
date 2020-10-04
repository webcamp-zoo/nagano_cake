class ChangeDateNameToProductGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column :product_genres, :name, :string
  end
end
