FactoryBot.define do
  factory :user do
    trait :a do
      name                 { "user1" }
      email                { "user1@user.com" }
      password             { "foobar" }
      password_confirmation{ "foobar" }
      profile              { "Hello, world!" }
    end

    trait :b do
      name                 { "user2" }
      email                { "user2@user.com" }
      password             { "foobar" }
      password_confirmation{ "foobar" }
      profile              { "Hello, world!" }
    end

    trait :c do
      name                 { "user3" }
      email                { "user3@user.com" }
      password             { "foobar" }
      password_confirmation{ "foobar" }
      profile              { "Hello, world!" }
    end
  end
end
