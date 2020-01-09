class Card < ApplicationRecord
  belongs_to :user

  validates :number, :expiration, :security_code, presence: true
end
