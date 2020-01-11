class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :number, :expiration, :security_code, presence: true
end
