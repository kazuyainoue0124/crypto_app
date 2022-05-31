require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  before do
    @user1 = create(:user, :a)
    @user2 = create(:user, :b)
  end

  context 'フォロー、フォロー解除' do
    it 'user1がuser2をフォロー、フォロー解除する' do
      log_in_as(@user1)
      visit user_path(@user2)

      # @user2をフォローする
      find('.btn-follow').click
      expect(page).to have_selector '.btn-default'
      expect(@user1.following.count).to eq(1)
      expect(@user2.followers.count).to eq(1)
     
      # @user2をフォロー解除する
      find('.btn-default').click
      expect(page).to have_selector '.btn-follow'
      expect(@user1.following.count).to eq(0)
      expect(@user2.followers.count).to eq(0)
    end
  end
end
