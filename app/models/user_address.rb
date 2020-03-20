class UserAddress < ApplicationRecord
  # 商品送付先住所情報
    # 送付先氏名が名字名前でそれぞれ必須、全角入力
  validates :first_destinaition_name, :destinaition_name, 
    # 送付先ふりがなが名字と名前でそれぞれ必須、かな全角入力
            :first_destinaition_kana,:destinaition_kana,presence: true, length: { maximum: 50 }
    # 郵便番号必須
  validates :postal_code, presence: true
    # 都道府県必須
  validates :prefectures, presence: true
    # 市区町村必須
  validates :municipality, presence: true
    # 番地必須
  validates :address, presence: true
    # マンション、ビル名任意
  
    # 届け先電話番号任意
  
end
