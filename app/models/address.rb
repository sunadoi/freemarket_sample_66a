class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, :prefecture, :city, :street, :building, presence: true
end
