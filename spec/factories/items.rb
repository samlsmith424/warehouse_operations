FactoryBot.define do
  factory :item do
    name { Faker::Appliance.equipment }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(r_digits: 2) }
  end
end
