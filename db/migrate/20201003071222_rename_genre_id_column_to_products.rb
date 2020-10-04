class RenameGenreIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :genre_id, :product_genre_id
  end
end
