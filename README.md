# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false,|
| email              | string | null: false, unique: true |
| password           | string | null: false |
| name               | string | null: false |
| name_reading       | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one  :address

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | text   | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| fee                | string | null: false |
| region             | string | null: false |
| days               | string | null: false |
| price              | string | null: false |
| user               | reference | null: false, foreign_key: true |

### Association

- has_one     :address
- has_one     :purchases
- belongs_to  :users

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Association

- belongs_to  :users
- belongs_to  :items

## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| block              | string | null: false |
| building           | string | null: false |
| phone_number       | string | null: false |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Association

- belongs_to  :users
- belongs_to  :items