class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー情報
    # ニックネームは必須（空にしない）
  validates :nickname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # メールアドレスは 一意、            ＠とドメインを含む必要がある
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    # パスワードは                必須、            ７文字以上                確認用で2回入力
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  # 本人確認情報
    # ユーザー本名は、苗字と名前でわける、全角入力のみ
  validates :name, presence: true, format: { wiht: /\A[ぁ-んァ-ン一-龥]/ }
    # 本名ふりがなは、苗字と名前でわける、かな全角入力のみ
  validates :name_kana, presence: true, format: { wiht: /\A[ぁ-んァ-ン一-龥]/ }
    # 生年月日は必須
  validates :birthday, presence: true
end
