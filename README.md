# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| profile            | text                | null: false               |
| last_name          | text                | null: false               |
| first_name         | text                | null: false               |
| last_name_kana     | text                | null: false               |
| first_name_kana    | text                | null: false               |
| birth_year         | text                | null: false               |
| birth_month        | text                | null: false               |
| birth_day          | text                | null: false               |

### Association

* belongs_to :user

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| catch_copy                          | text       | null: false                    |
| concept                             | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |
| description                         | text       | null: false,                   |
| category                            | text       | null: false,                   |
| status                              | text       | null: false,                   |
| delivery_pay_which                  | references | null: false,                   |
| delivery_area                       | references | null: false,                   |
| delivery_days                       | references | null: false,                   |
| price                               | references | null: false,                   |

### Association

- belongs_to :user

##  Purchase Records

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| comment     | text       | null: false                    |

### Association

- has_many : comments


##  Shipping Addresses

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| comment     | text       | null: false                    |

### Association

- has_many : comments