class Address < ApplicationRecord

	belongs_to :customer

	validates :name, :address, presence: true
	validates :postal_code, length: {is: 7}

	def order_address
		self.postal_code + self.address + self.name
	end
end
