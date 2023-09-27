FactoryBot.define do
  factory :tagging do
    association :hashtag
    association :tweet
  end
end
