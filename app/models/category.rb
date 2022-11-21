class Category < ApplicationRecord
  has_many :soaps

  validates :name, presence: true
end
