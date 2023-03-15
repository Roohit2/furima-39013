FactoryBot.define do
  factory :item do
    association :user
    name                  {'商品A'}
    description           {'商品の説明です'}
    category_id           {2}
    status_id             {2}
    delivery_cost_id      {2}
    delivery_prefecture_id{2}
    delivery_day_id       {2}
    price                 {300}

        after(:build) do |message|
      message.image.attach(io: File.open('public/images/dummy.png'), filename: 'dummy.png')
    end

  end
end