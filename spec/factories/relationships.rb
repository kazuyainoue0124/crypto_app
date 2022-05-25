FactoryBot.define do
  factory :relationship do
    follower_id{ FactoryBot.create(:user, :a).id }
    followed_id{ FactoryBot.create(:user, :b).id }
  end
end
