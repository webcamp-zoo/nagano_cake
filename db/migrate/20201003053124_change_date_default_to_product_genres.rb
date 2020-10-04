class ChangeDateDefaultToProductGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :product_genres, :name, from: "0", to: nil
  end
end
