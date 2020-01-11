FactoryBot.define do
  factory :user do
      nickname           {Faker::Name.name}
      email              {Faker::Internet.email}
      password           {Faker::Internet.password(7)}
      last_name          {Faker::Name.last_name}
      first_name         {Faker::Name.first_name}
      last_name_kana     {"ヤマダ"}
      first_name_kana    {"タロウ"}
      birthday           {Faker::Date.birthday}
      tel                {Faker::PhoneNumber.cell_phone}
  end
end