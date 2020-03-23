class Category < ApplicationRecord
  has_many :items
  has_ancestry
end

# item.rbに追記
# 　belongs_to user, foreign_key: 'user_id'
# 　belongs_to :category
