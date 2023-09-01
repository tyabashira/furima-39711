# README
## usersテーブル

| Column                | Type       | Options                                     |
| ------                | ---------- | ------------------------------              |
| user_name             | references | null: false,foreign_key: true |
| email                 | string     | null: false,unique: true |
| encrypted_password    |string      | null: false,unique: true |
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
has_many :items
belongs_to :user
has_one :shpping

## itemsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| item      | string     | null: false |
| image     | image      | null: false |
| item_text | text       | null: false |
| category  | string     | null: false |
| quality   | string     | null: false |
| cost      | integer    | null: false |
| region    | string     | null: false |
| post_day  | integer    | null: false |
| user      | references | null: false, foreign_key: true |
### association
belongs_to :user
belongs_to :furima


## shoppingsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| post_code |integer     | null: false |
| states    | string     | null: false |
| city      | string     | null: false |
| street    | string     | null: false |
| build     | string     |             |
| phone     | integer    | null: false |
| user      | references | null: false, foreign_key: true |
### association
belongs_to :furima
