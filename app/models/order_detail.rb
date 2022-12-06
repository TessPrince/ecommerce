class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :soap

  validates :price, :quantity, presence:true
  validates :quantity, numericality: {only_integer: true}
end
