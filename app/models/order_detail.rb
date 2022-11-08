class OrderDetail < ApplicationRecord
  belongs_to :orders
  belongs_to :soaps

  validates :price, :quantity, presence:true
  validates :quantity, numericality: {only_integer: true}
end
