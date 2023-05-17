FactoryBot.define do
  factory :item do
    name               { 'ミッキーのぬいぐるみ' }
    discription        { 'ディズニー40周年記念に発売された、パーク内限定商品です。' }
    category_id        { '3' }
    condition_id       { '3' }
    delivery_charge_id { '3' }
    prefecture_id      { '3' }
    shipping_day_id    { '3' }
    price              { '4000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
