![image](https://user-images.githubusercontent.com/61194189/76930165-38752b80-6929-11ea-9b2b-372151916962.png)

# freemarket_sample_71c

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nnickname|string|null: false|
|name|string|null: false|
|name_ruby|string|null: false|
|birthday|date|null: false|
|phone_number|integer||
|address_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :address
- has_many :cards
- has_many :items

## user_address
|Column|Type|Options|
|------|----|-------|
|destinaition_name|string|null: false|
|destinaition_ruby|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string||
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_name|string|null: false|
|card_number|integer|null: false|
|cvc|integer|null: false|
|exp_month|intenger|null: false|
|exp_year|intenger|null: false|
|user_id|intenger|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|string|null: false|
|state|string|null: false|
|postage|integer|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|region|string|null: false|
|state|string|null: false|
|seler_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :categry
- belongs_to :brand
- has_many :images

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item