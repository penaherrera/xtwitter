FactoryBot.define do
  factory :reply do
    content { "MyString" }
    tweet_id { nil }
    author_username { nil }
  end
end
