class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :brand
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true
  has_many :likes
  has_many :comments
  has_one :buyer
  has_one :seller

  validates :name, :description, :shipping_charge, :shipping_method, :shipping_prefecture, :shipping_days, :price, :progress, presence: true
  enum size: {
    XXS以下:1, XS:2, S:3, M:4, L:5, XL:6,
    "2XL":7, "3XL":8, "4XL(5L)以上":9, "FREE SIZE":10
  }
  enum condition: {
    新品、未使用:1, 未使用に近い:2, 目立った傷や汚れなし:3, 
    やや傷や汚れあり:4, 傷や汚れあり:5, 全体的に状態が悪い:6
  }

  
end
