FactoryBot.define do
  factory :feed do
    trait :a do
      name   { "coindesk" }
      rss_url{ "https://www.coindeskjapan.com/rss" }
      url    { "https://www.coindeskjapan.com/" }
    end
  end
end
