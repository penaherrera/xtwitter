FactoryBot.define do
  factory :like do
    association :author
    association :tweet
  end
end
