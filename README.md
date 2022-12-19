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
| birthday           | date    | null: false               |


### Association

- has_many :orders
- has_many :items


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| explanation        | text       | null: false                    |
| condition_id       | integer    | null: false                    |
| Delivery_charge_id | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| Prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :order


## orders テーブル

| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| user        | references | null: false, foreign_key: true     |
| item        | references | null: false, foreign_key: true     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

