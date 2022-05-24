# テーブル設計



## usersテーブル
| Column     | Type       | Options                        |
|----------|----------|------------------------------|
|nickname       |string|null: false|
|email          |string|null: false, unique: true|
|first_name     |string|null: false|
|last_name      |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana |string|null: false|
|encrypted_password|string|null: false|
|birthday       |date  |null: false|

Association
has_many :products
has_many :purchases

## products テーブル
| Column     | Type       | Options                        |
|----------|----------|------------------------------|
|name           |string    |null: false|
|explanation    |text      |null: false|
|category_id    |integer   |null: false|
|status_id      |integer   |null: false|
|prefecture_id  |integer   |null: false|
|send_day_id    |integer   |null: false|
|derively_fee_id|integer   |null: false|
|price          |integer   |null: false|
|user_id        |references|null: false foreign_key: true|


Association
belongs_to :user
has_one :purchase





## addressesテーブル
| Column     | Type       | Options                        |
|----------|----------|------------------------------|
|postal_code    |string    |null: false|
|prefecture_id  |integer   |null: false|
|municipality   |string    |null: false|
|address        |string    |null: false|
|building_name  |string    |   |
|phone_number   |string    |null: false|
|purchase       |references|null: false foreign_key: true|

Association
belongs_to :purchase


## purchases テーブル
| Column     | Type       | Options                        |
|----------|----------|------------------------------|
|user_id   |references   |null: false, foreign_key: true|
|product_id|references   |null: false, foreign_key: true|

Association
belongs_to :user
belongs_to :product 
has_one :address


