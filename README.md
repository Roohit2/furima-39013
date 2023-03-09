# DB 設計

## users table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false                    |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| last_name          | string              | null: false                    |
| first_name         | string              | null: false                    |
| last_name_kana     | string              | null: false                    |
| first_name_kana    | string              | null: false                    |
| birth_date         | DATE                | null: false                    |

### Association
 has_many   : items
 has_many   : purchaseRecords


## items table
| Column                              | Type       | 外部キー |   Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     |          |null: false                    |
| description                         | text       |          |null: false                    |
| category_id                         | integer    |          |null: false                    |
| status_id                           | integer    |          |null: false                    |
| delivery_cost_id                    | integer    |          |null: false                    |
| delivery_prefecture_id              | integer    |          |null: false                    |
| delivery_days_id                    | integer    |          |null: false                    |
| price                               | integer    |          |null: false                    |
| user                                | references |          |null: false,foreign_key: true  |


### Association
 has_one  : purchaseRecord
 has_one  : user


##  purchaseRecords table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| foreign_key | references | null: false, foreign_key: true |

### Association
 has_one : deliveryInformation 


##  deliveryInformations table
| Column                  | Type       | Options                       |
|-------------------------|------------|-------------------------------|
| postal_code             | string     | null: false                   |
| delivery_prefecture_id  | integer    | null: false                   |
| city                    | string     | null: false                   |
| house_number            | string     | null: false                   |
| building_name           | string     |                               |
| phone_number            | string     | null: false                   |

### Association
 belongs to : purchaseRecord 