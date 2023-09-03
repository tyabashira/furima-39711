# README
## usersテーブル

| Column                | Type       | Options                                     |
| ------                | ---------- | ------------------------------              |
| user_name             | string     | null: false |
| email                 | string     | null: false,unique: true |
| encrypted_password    |string      | null: false |
| first_name            | string     | null: false |
| last_name             | string     | null: false |
| first_kana            | string     | null: false |
| last_kana             | string     | null: false |
| birth                 | date       | null: false |
### association
has_many :furimas
has_many :items


## furimasテーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### association
belongs_to :item
belongs_to :user
has_one :shpping

## itemsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| item_name | string     | null: false |
| item_text | text       | null: false |
| category_id| interger   | null: false |
| quality_id| integer    | null: false |
| cost_id   | integer    | null: false |
| region_id | integer    | null: false |
| post_day_id| integer   | null: false |
| price     | integer    | null: false |
| states_id | integer    | null: false |
| user      | references | null: false, foreign_key: true |
### association
belongs_to :user
has_one :furima


## shoppingsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| post_code | string     | null: false |
| states_id | integer    | null: false |
| city      | string     | null: false |
| street    | string     | null: false |
| build     | string     |             |
| phone     | string     | null: false |
| user      | references | null: false, foreign_key: true |
### association
belongs_to :furima
