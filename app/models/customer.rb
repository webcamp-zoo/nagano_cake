class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy
  has_many :orders
  has_many :addresses
  # enum is_deleted: {Available: true, Invalid: false}

  #def self.full_name(customer)
     # customer.first_name + customer.last_name
  #end

  def full_name
    "#{last_name} #{first_name}"
  end
  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end
end
