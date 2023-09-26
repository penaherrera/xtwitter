FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.characters(number: 255) }
    association :author, factory: :author
  end
end
