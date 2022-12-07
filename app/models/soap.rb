class Soap < ApplicationRecord
  paginates_per 24
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :category
  has_one_attached :image

  validates :name, :price, :weight, :stock, presence:true
  validates :stock, numericality: {only_integer: true}
end
