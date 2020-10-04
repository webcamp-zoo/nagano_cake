class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy

	belongs_to :product_genre

	attachment :image, destroy: false

	validates :name, :product_genre_id, :price, presence: true

end
