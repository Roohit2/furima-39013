# DB 設計

## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| YYYYMMDD           | integer             | null: false               |

### Association
 has_many   : items
 has_many   : purchaseRecords


## items table
| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| description                         | text       | null: false                    |
| price                               | integer    | null: false                    |


### Association
 has_one  : purchaseRecord


##  purchaseRecords table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| who         | string     | null: false, foreign_key: true |
| bought_item | text       | null: false, foreign_key: true |

### Association
- has_one : deliveryInformation 


##  deliveryInformations table
| Column          | Type       | Options                        |
|-------------    |------------|--------------------------------|
| postal_code     | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |