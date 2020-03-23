class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping  
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :category

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  

  # - 商品名が必須
  validates :name, presence: true, length: { maximum: 40 }

  # - 商品の説明が必須
  validates :content, presence: true, length: { maximum: 1000 }

  # - 商品の状態についての情報が必須
  validates :state, presence: true

  # - 発送までの日数についての情報が必須
  validates :shipping_id, presence: true

  # - 発送元の地域についての情報が必須
  validates :prefecture_id, presence: true

  # - 価格についての情報が必須
  validates :price, presence: true

  # - 画像は1枚以上必須
  validates :images, presence: true

  # - 出品者情報必須
  validates :seller_id, presence: true

  # - カテゴリーの情報が必須
  validates :category_id, presence: true

  # - 配送料の負担についての情報が必須
  validates :postage, presence: true
end
