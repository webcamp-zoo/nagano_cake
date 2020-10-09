class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	validates :product_id, presence: true
	validates :customer_id, presence: true
    validates :quantity, presence: true
end
