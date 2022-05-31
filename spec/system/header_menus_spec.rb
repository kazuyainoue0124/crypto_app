require 'rails_helper'

RSpec.describe "HeaderMenus", type: :system do
  before do
    @user1 = create(:user, :a)
  end

  context 'ログインしていない場合' do
    it '左上ロゴ・ログインボタン・新規登録ボタンのみヘッダーに存在すること' do
      visit root_path
      aggregate_failures do
        expect(page).to have_link 'Crypto app', href: root_path
        expect(page).to have_link '新規登録', href: signup_path
        expect(page).to have_link 'ログイン', href: login_path
      end
    end
  end

  context 'ログインしている場合' do
    it '左上ロゴ・ログインボタン・新規登録ボタンのみヘッダーに存在すること' do
      log_in_as(@user1)
      aggregate_failures do
        expect(page).to have_link 'Crypto app', href: root_path
        expect(page).to have_link 'ホーム', href: root_path
        expect(page).to have_link 'マイページ', href: user_path(@user1)
        expect(page).to have_link 'ブックマーク', href: user_bookmarks_path(@user1)
        expect(page).to have_link 'ユーザ一', href: users_path
        expect(page).to have_link 'ログアウト', href: logout_path
      end
    end
  end
end
