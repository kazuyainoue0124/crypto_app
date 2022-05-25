require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "name, email, password, password_confirmationが存在すれば登録できること" do
      user = build(:user, :a)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, :a, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  
    it "emailがない場合は登録できないこと" do
      user = build(:user, :a, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  
    it "passwordがない場合は登録できないこと" do
      user = build(:user, :a, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  
    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, :a, password_confirmation: "barfoo")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  
    it "emailが重複している場合は登録できないこと" do
      user = create(:user, :a)
      another_user = build(:user, :a)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  
    it "nameが50文字以下であれば登録できること" do
      user = build(:user, :a, name: "a" * 50)
      expect(user).to be_valid
    end
  
    it "nameが51文字以上だと登録できないこと" do
      user = build(:user, :a, name: "a" * 51)
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
  
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, :a, password: "a" * 6, password_confirmation: "a" * 6)
      expect(user).to be_valid
    end
  
    it "passwordが5文字以下だと登録できないこと" do
      user = build(:user, :a, password: "a" * 5, password_confirmation: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  
    it "emailが正規表現に合っていない場合は登録できないこと" do
      expect(build(:user, :a, email: "user@example,com")).not_to be_valid
      expect(build(:user, :a, email: "user_at_foo.org")).not_to be_valid
      expect(build(:user, :a, email: "user.name@example.")).not_to be_valid
      expect(build(:user, :a, email: "foo@bar_baz.com")).not_to be_valid
      expect(build(:user, :a, email: "foo@bar+baz.com")).not_to be_valid
    end
  end
end
