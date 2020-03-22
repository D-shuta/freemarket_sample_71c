class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping  
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :state, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates :images, presence: true
end
