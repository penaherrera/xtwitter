 FactoryBot.define do
  factory :author do
    username { Faker::Internet.username }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'IoooGooo123!!!' }
    #password_confirmation { 'IoogoRubyOnRails123!' }
  end
end
