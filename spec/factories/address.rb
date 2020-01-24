FactoryBot.define do
  factory :address do
    postal_code        {Faker::Number.number(digits:7)}
    prefecture         {Faker::Number.between(from:1,to:48)}
    city               {Faker::Address.city}
    street             {Faker::Address.street_name}
    building           {"#{Faker::Ancient.god}ビル#{Faker::Number.number(digits:3).to_s}号室"}
  end
end