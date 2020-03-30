class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping  
  belongs_to_active_hash :state
  
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :category

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  

  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }


  validates :postage, :category_id, :seller_id, 
  :images, :price, :prefecture_id, :shipping_id, :state_id,
   presence: true

end
