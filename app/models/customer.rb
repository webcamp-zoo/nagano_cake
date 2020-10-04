class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

<<<<<<< Updated upstream
        enum is_deleted: {Available: true, Invalid: false}
=======
  has_many :cart_products, dependent: :destroy
>>>>>>> Stashed changes
end
