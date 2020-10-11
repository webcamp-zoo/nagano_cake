class Address < ApplicationRecord
	# validates :postal_code,: presence: true

	belongs_to :customer 

	def order_address
		self.postal_code + self.address + self.name
	end
end
