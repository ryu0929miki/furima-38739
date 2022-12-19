# README

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| family_name        | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birthday           | integer | null: false               |


### Association

- has_one :card
- has_one :order
- has_many :items


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| Product_name    | string     | null: false                    |
| explanation     | text       | null: false                    |
| condition       | integer    | null: false                    |
| Delivery_charge | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| brand_id        | references | null: false, foreign_key: true |
| category_id     | references | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| Prefectures  | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## cards テーブル

| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| user_id     | references | null: false, foreign_key: true     |
| card_id     | string     | null: false                        |
| customer_id | string     | null: false                        |

### Association

- belongs_to :user

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## brands テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |

### Association
- has_many :items


## categories テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |
| genre  | string     | null: false                    |

### Association
- has_many :items