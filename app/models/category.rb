class Category < ApplicationRecord
  #アイテム側に親、子、孫でカテゴリーを渡す
  has_many :items
  #gemを導入後に記載
  # has_ancestry

# カテゴリー各種
  validates :name,presence: true
end

# item.rbに追記
# 　belongs_to user, foreign_key: 'user_id'
# 　belongs_to :category
