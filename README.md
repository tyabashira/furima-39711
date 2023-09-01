# README
## usersテーブル

| Column      | Type       | Options                                     |
| ------      | ---------- | ------------------------------              |
| user_name   | references | null: false,unique: true, foreign_key: true |
| mail        | string     | null: false |
| password    |string      | null: false,unique: true |
| first_name  | string     | null: false |
| last_name   | string     | null: false |
| birth       | string     | null: false |
### association
has_many :furimas
has_many :items
has_many :customars

## furimasテーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| image      | image      | null: false |
| main_text  | text       | null: false |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### association
has_many :items
belongs_to :user

## itemsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
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
belongs_to :customar

## custmarsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| shopping  | references | null: false, foreign_key: true |
### association
has_one :shopping
has_many :customar
## shoppingsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| post_code |integer     | null: false |
| states    | string     | null: false |
| city      | string     | null: false |
| user      | references | null: false, foreign_key: true |
### association
belongs_to :customar
