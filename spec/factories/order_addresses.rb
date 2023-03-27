FactoryBot.define do

  factory :order_address do
    # association :user
    # association :item
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '神奈川県' }
    house_number { '111' }
    building { 'エスポワール' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end

end

