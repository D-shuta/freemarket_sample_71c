class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー情報
    # ニックネームは必須（空にしない）
  validates :nickname, presence: true, length: { maximum: 50 }

    # メールアドレスは一意
  validates :email, uniqueness: true
    # パスワードは                必須、            ７文字以上
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  # 本人確認情報
    # ユーザー本名は、苗字と名前でわける、全角入力のみ
  validates :name, :first_name, presence: true
    # 本名ふりがなは、苗字と名前でわける、かな全角入力のみ
  validates :name_kana, :first_name_kana, presence: true
    # 生年月日は必須
  validates :birthday, presence: true

  has_one :user_address
  accepts_nested_attributes_for :user_address

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sale_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"  
  has_many :cards
  has_many :purchase
end
