FactoryBot.define do
  factory :warehouse do
    name { Faker::App.name }
    location { Faker::Nation.capital_city }
  end
end
