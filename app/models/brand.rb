class Brand < ApplicationRecord
  #ブランド情報をアイテム側へ
  has_many :items
  #ブランド一覧は必須ではない
end
