class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy

  has_many :addresses
  enum is_deleted: {Available: true, Invalid: false}

end
