 FactoryBot.define do
  factory :author do
    username { Faker::Internet.username }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password( min_length:12, max_length:15, mix_case: true, special_characters: true ) }
  end
end
