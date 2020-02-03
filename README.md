# Gifts-space DB設計

![ER](https://user-images.githubusercontent.com/57346263/73085998-11930e00-3f13-11ea-87d0-8a31b8152ea4.png)


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|user_id|references|foreign_key: true|

### Association

- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|foreign_key: true|

### Association

- has_one :user


## giftsテーブル

|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|hope_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :hope
- belongs_to :user


## hopesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|message|string|null: false|
|desired_price|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belings_to :user
- has_many :gifts


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|myphoto|string|
|mycomment|string|
|user_id|references|null: false, foreign_key: true|

### Association

- has_one :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, uniqueness: true|
|email|string|null: false|
|password|string|null: false|
|provider|string|
|uid|string|

### Association

- has_many :addresses
- has_many :hopes
- has_one :profile
- has_one :card
