class Card < ApplicationRecord
  # validates :card_name, presence: true
  # validates :card_number, presence: true, length: { minimum: 16 }
  # validates :cvc, presence: true, length: { minimum: 3 }
  # validates :exp_month, presence: true
  # validates :exp_year, presence: true
  belongs_to :user
  has_many :purchase
end
