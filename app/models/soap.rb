class Soap < ApplicationRecord
  has_many :order_details
  belongs_to :category
  has_one_attached :image

  validates :name, :price, :weight, :stock, presence:true
  validates :stock, numericality: {only_integer: true}
end
