require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe '#create' do
    # 下記はエラーが生じる
    it "follower_id, followed_idが存在すれば登録できること" do
      expect(build(:relationship)).to be_valid
    end

    it "follower_idが存在しない場合は登録できないこと" do
      expect(build(:relationship, follower_id: nil)).not_to be_valid
    end

    it "followed_idが存在しない場合は登録できないこと" do
      expect(build(:relationship, followed_id: nil)).not_to be_valid
    end
  end
end
