FactoryBot.define do
  factory :bookmark do
    user_id{ FactoryBot.create(:user, :a).id }
    entry_id{ FactoryBot.create(:entry, :a).id }
  end
end
