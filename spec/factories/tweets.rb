FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence } 
    association :author, factory: :author
  end
end
