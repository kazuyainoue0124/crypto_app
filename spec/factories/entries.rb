FactoryBot.define do
  factory :entry do
    trait :a do
      title    { "イーサリアム財団が法定通貨を保有する理由【コラム】" }
      published{ "Wed, 04 May 2022 22:00:00 UTC +00:00" }
      content  { nil }
      url      { "https://www.coindeskjapan.com/147966/" }
      feed_id  { FactoryBot.create(:feed, :a).id }
    end

    trait :b do
      title    { "NFTビジネス：企業のための新戦略【コラム】" }
      published{ "Wed, 04 May 2022 22:00:00 UTC +00:00" }
      content  { nil }
      url      { "https://www.coindeskjapan.com/147878/" }
      feed_id  { FactoryBot.create(:feed, :a).id }
    end

    trait :c do
      title    { "NFTビジネス：企業のための新戦略【コラム】" }
      published{ "Wed, 04 May 2022 22:00:00 UTC +00:00" }
      content  { nil }
      url      { "https://www.coindeskjapan.com/147878/" }
      feed_id { FactoryBot.create(:feed, :a).id }
    end
  end
end
