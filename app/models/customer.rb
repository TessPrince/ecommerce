class Customer < ApplicationRecord
  has_many :orders

  validates :email, :password, :full_name, :billing_address, :shipping_address, :country, :access, presence:true
end
