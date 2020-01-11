class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postal_code, :prefecture, :city, :street, :building, presence: true
end
