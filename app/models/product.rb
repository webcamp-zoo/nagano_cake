class Product < ApplicationRecord
<<<<<<< Updated upstream

   
=======
	has_many :cart_products, dependent: :destroy
>>>>>>> Stashed changes
end
