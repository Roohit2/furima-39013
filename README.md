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
| birth_date         | date                | null: false                    |

### Association
 has_many   : items
 has_many   : purchaseRecords


## items table
| Column                              | Type       |    Options                     |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| description                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| status_id                           | integer    | null: false                    |
| delivery_cost_id                    | integer    | null: false                    |
| delivery_prefecture_id              | integer    | null: false                    |
| delivery_day_id                     | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false,foreign_key: true  |


### Association
 has_one    : purchaseRecord
 belongs_to : user


##  purchaseRecords table
| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
 has_one    : deliveryInformation 
 belongs_to : item
 belongs_to : user


##  deliveryInformations table
| Column                  | Type       | Options                       |
|-------------------------|------------|-------------------------------|
| postal_code             | string     | null: false                   |
| delivery_prefecture_id  | integer    | null: false                   |
| city                    | string     | null: false                   |
| house_number            | string     | null: false                   |
| building_name           | string     |                               |
| phone_number            | string     | null: false                   |
| purchaseRecord          | references | null: false foreign_key: true |

### Association
 belongs_to : purchaseRecord 