FactoryBot.define do
  factory :reply do
    content { Faker::Lorem.characters(number: 255) }
    association :author
    association :tweet
  end
end
