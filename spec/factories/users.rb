FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa0000'}
    password_confirmation {password}
    last_name             {'あいう'}
    first_name            {'エオカ'}
    last_name_kana        {'アイウ'}
    first_name_kana       {'エオカ'}
    birth_date            {'1950-11-11'}
  end
end