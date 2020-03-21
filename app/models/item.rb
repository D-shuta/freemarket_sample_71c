class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :state, presence: true
  validates :postage, presence: true
  validates :price, presence: true

  has_many :images
  accepts_nested_attributes_for :images
end
