class Soap < ApplicationRecord
  paginates_per 24
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :category
  has_one_attached :image

  validates :name, :price, :weight, :stock, presence:true
  validates :stock, numericality: {only_integer: true}

  def multiply_price
    (self.price * 100).to_i
  end

  def display_name
    Jbuilder.new do |soap|
      soap.name self.name
      soap.description self.description
    end
  end

  def to_builder
    Jbuilder.new do |soap|
      soap.currency "cad"
      soap.unit_amount multiply_price
      soap.product_data self.display_name
    end
  end
end
