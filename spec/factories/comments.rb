FactoryBot.define do
  factory :comment do
    content{ "Hello, world!" }
    user_id{ FactoryBot.create(:user, :a).id }
    entry_id{ FactoryBot.create(:entry, :a).id }
  end
end
