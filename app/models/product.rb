class Product < ApplicationRecord

	belongs_to :product_genre

	attachment :image, destroy: false

	validates :name, :product_genre_id, :price, presence: true
end
