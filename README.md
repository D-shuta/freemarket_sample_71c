![image](https://user-images.githubusercontent.com/61194189/76852551-f13a5c80-688e-11ea-8c8e-362deb5f2143.png)

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
|phone_number|integer|null: false|
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


|Column|Type|Options|
|------|----|-------|

|Column|Type|Options|
|------|----|-------|

|Column|Type|Options|
|------|----|-------|

|Column|Type|Options|
|------|----|-------|