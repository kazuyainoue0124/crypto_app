require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it "user_idとentry_idが存在すれば登録できること" do
    expect(build(:bookmark)).to be_valid
  end

  it "user_idが存在しない場合は登録できないこと" do
    expect(build(:bookmark, user_id: nil)).not_to be_valid
  end

  it "entry_idが存在しない場合は登録できないこと" do
    expect(build(:bookmark, entry_id: nil)).not_to be_valid
  end
end
