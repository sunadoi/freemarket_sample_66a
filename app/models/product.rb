class Product < ApplicationRecord
  belongs_to :user
  belongs_to :large_category
  belongs_to :middle_category
  belongs_to :small_category
  belongs_to :brand
  has_many :photos
  has_many :likes
  has_many :comments
  has_one :buyer
  has_one :seller

  validates :name, :description, :shipping_charge, :shipping_method, :shipping_prefecture, :shipping_days, :price, :progress, presence: true
end
