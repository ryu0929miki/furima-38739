FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.name }
    explanation { Faker::Lorem.characters(16) }
    category_id { Faker::Number.within(range: 1..10) }
    delivery_charge_id { Faker::Number.within(range: 1..2) }
    condition_id { Faker::Number.within(range: 1..6) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    shipping_day_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end

end
