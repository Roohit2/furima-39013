# DB 設計

## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| mail_address       | string              | null: false, unique: true |
| password           | string              | null: false               |
| last_name          | text                | null: false               |
| first_name         | text                | null: false               |
| last_name_kana     | text                | null: false               |
| first_name_kana    | text                | null: false               |
| birth_year         | text                | null: false               |
| birth_month        | text                | null: false               |
| birth_day          | text                | null: false               |

### Association
 has_many   : items


## items table
| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| image                               | text       | null: false                    |
| price                               | text       | null: false                    |
| delivery_cos                        | text       | null: false                    |
| delivery_prefecture                 | text       | null: false                    |
| delivery_days                       | text       | null: false                    |
| category                            | text       | null: false                    |
| status                              | text       | null: false                    |

### Association

 has_one  : purchaseRecords
 has_many : deliveryInfo


##  purchaseRecords table
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| name        | string     | null: false, foreign_key: true |
| item        | text       | null: false, foreign_key: true |

##  deliveryInfo table
| Column          | Type       | Options                        |
|-------------    |------------|--------------------------------|
| postal_code     | text       | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | text       | null: false                    |


### Association
- has_many : comments