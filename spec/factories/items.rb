FactoryBot.define do
  factory :item do
    image                 {'dummy.jpg'}
    name                  {'商品A'}
    description           {'商品の説明です'}
    category_id           {1}
    status_id             {2}
    delivery_cost_id      {1}
    delivery_prefecture_id{2}
    delivery_day_id       {1}
    price                 {300}
  end
end