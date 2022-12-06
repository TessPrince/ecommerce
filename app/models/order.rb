class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user

  validates :amount, :order_status, presence:true
end
