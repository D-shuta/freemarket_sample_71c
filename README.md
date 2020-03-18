![image](https://user-images.githubusercontent.com/61194189/76920918-0a372200-6910-11ea-81cb-e8e049d0e200.png)

# freemarket_sample_71c
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|mickname|string|null: false|
|name|string|null: false|
|name_ruby|string|null: false|
|birthday|date|null: false|
|destinaition_name|string|null: false|
|destinaition_ruby|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|integer||
### Association
- has_many :cards
- has_many :items

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
|seler_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|
### Association
- belongs_to :user
- has_many :categores-items
- has_many :categores
- has_many :categores, through: :categores-items
- has_many :images
- belongs_to :brand

## categores-itemsテーブル
|Column|Type|Options|
|------|----|-------|
|categery_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :categore

## categoresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :categores-items
- has_many :items, through: :categores-items
- has_many :items
- has_many :categores-brands
- has_many :bramds, through: :categores-brends
- has_many :brands

## categores-brandsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :brand

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :categores-brands
- has_many :categores, through: :categores-brends
- has_many :categores

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item