# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
has_many : items
has_many : purchasers



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| discription     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            | string     | null: false                    |
| days            | string     | null: false                    |
| price           | integer    | null: false                    |
| tax             | integer    | null: false                    |
| benefit         | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| purchaser_id    | references | null: false, foreign_key: true |

### Association
belongs_to : user
belongs_to :purchaser



## purchasers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |
| card_name      | string     | null: false                    |
| effective_date | integer    | null: false                    |
| security_code  | integer    | null: false                    |

### Association
belongs_to :user
has_many :items
has_one :delivery_address



## delivery_addresses　テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchaser_id   | references | null: false, foreign_key: true |
| postcord       | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone          | integer    | null: false                    |
| price          | integer    | null: false                    |

### Association
belongs_to :purchaser