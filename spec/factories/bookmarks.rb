FactoryBot.define do
  factory :bookmark do
    association :author
    association :tweet
  end
end
