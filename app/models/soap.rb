class Soap < ApplicationRecord
  has_many :order_details

  validates :name, :price, :weight, :stock, presence:true
  validates :stock, numericality: {only_integer: true}
end
