class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :state, presence: true
  validates :postage, presence: true
  validates :price, presence: true

  has_many :images
  accepts_nested_attributes_for :images
end
