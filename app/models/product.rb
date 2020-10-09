class Product < ApplicationRecord

	has_many :cart_products, dependent: :destroy
	has_many :orders, through: :order_products
	has_many :order_products
	belongs_to :product_genre

	attachment :image, destroy: false

	validates :name, :product_genre_id, :price, presence: true
	validates :introduction, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }

end
