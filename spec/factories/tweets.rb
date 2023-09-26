FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence( min_length:1, max_length:255) } 
    association :author, factory: :author
  end
end
