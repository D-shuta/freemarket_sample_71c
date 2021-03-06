class UserAddress < ApplicationRecord
  # 商品送付先住所情報
    # 送付先氏名が名字名前でそれぞれ必須、全角入力
  validates :first_destinaition_name, :destinaition_name, 
    # 送付先ふりがなが名字と名前でそれぞれ必須、かな全角入力
            :first_destinaition_kana,:destinaition_kana,presence: true, length: { maximum: 50 }
    # 郵便番号必須
  validates :postal_code, presence: true, length: { is: 7 }
    # 都道府県必須
  validates :prefectures, presence: true
    # 市区町村必須
  validates :municipality, presence: true, length: { maximum: 50 }
    # 番地必須
  validates :address, presence: true
    # 電話番号
  validates :phone_number, length: { maximum: 11 }

  belongs_to :user, optional: true
end
