FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 5) }
    association :author, factory: :author
  end
end
