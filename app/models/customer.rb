class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

<<<<<<< HEAD
<<<<<<< Updated upstream
        enum is_deleted: {Available: true, Invalid: false}
=======
  has_many :cart_products, dependent: :destroy
>>>>>>> Stashed changes
=======

  has_many :addresses
  enum is_deleted: {Available: true, Invalid: false}

>>>>>>> 5b378f93df60a9d1053dc689e28fac062e6c150c
end
