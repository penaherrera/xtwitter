FactoryBot.define do
  factory :follower do
    association :follower_author, factory: :author
    association :following_author, factory: :author
  end
end
