class Order < ApplicationRecord
  has_many :order_details
  has_many :soaps, through: :order_details
  belongs_to :user, optional: true

  before_save :set_amount

  def amount
    order_details.collect { |order_detail| order_detail.valid? ? order_detail.price * order_detail.quantity : 0 }.sum
  end

  private
  def set_amount
    self[:amount] = amount
  end

end
