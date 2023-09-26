FactoryBot.define do
  factory :quote do
    body { Faker::Lorem.characters(number: 255) }
    association :author
    association :tweet
  end
end
