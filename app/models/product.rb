class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	belongs_to :product_genre
	has_many :orders, through: :order_products
	has_many :order_products

	attachment :image, destroy: false

	validates :name, :product_genre_id, :price, presence: true

end
