FactoryBot.define do
  factory :product do
    user_id            {Faker::Number.decimal_part(digits:4)}
    brand_id           {Faker::Number.between(from:1,to:9)}
    category_id        {Faker::Number.between(from:1,to:1000)}
    size               {Faker::Number.between(from:1,to:10)}
    condition          {Faker::Number.between(from:1,to:6)}
    name               {'CHANELのジャケット'}
    description        {Faker::Quote.famous_last_words}
    shipping_charge    {Faker::Number.between(from:1,to:2)}
    shipping_method    {Faker::Number.between(from:1,to:8)}
    shipping_prefecture{Faker::Number.between(from:1,to:47)}
    shipping_days      {Faker::Number.between(from:1,to:3)}
    price              {Faker::Number.decimal_part(digits:6)}
    progress           {1}
  end
end
