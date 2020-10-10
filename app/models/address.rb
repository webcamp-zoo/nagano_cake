class Address < ApplicationRecord
	validates :order_address, presence: true

	belongs_to :customer 

	def order_address
		self.postal_code + self.address + self.name
	end
end
