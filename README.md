# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false,|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_reading  | string | null: false |
| first_name_reading | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one  :address

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| item_name          | text    | null: false |
| description        | text    | null: false |
| detail_id          | integer | null: false |
| detail_id          | integer | null: false |
| detail_id          | integer | null: false |
| detail_id          | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- has_one     :address
- has_one     :purchase
- belongs_to  :user

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item

## addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| post_code          | string  | null: false |
| detail_id          | integer | null: false |
| city               | string  | null: false |
| block              | string  | null: false |
| building           | string  |
| phone_number       | string  | null: false |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item