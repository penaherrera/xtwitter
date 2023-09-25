FactoryBot.define do
  factory :quote do
    content { "MyString" }
    quoted_tweet_id { nil }
    author_username { nil }
  end
end
