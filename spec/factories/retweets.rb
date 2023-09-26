FactoryBot.define do
  factory :retweet do
    association :author
    association :tweet
  end
end
