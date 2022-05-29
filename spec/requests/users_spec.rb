require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:base_title) { 'Crypto App for Portfolio' }

  describe "GET /users/new" do
    it "新規登録ページが正しく表示されること" do
      get signup_path
      expect(response).to have_http_status(200)
      # expect(response.body).to match(/<title>新規登録 | #{base_title}<\/title>/i)
      assert_select "title", "新規登録 | #{base_title}"
    end
  end

  describe "GET /users" do
    it "ログインしていないとユーザ一覧が表示されないこと" do
      get users_path
      expect(response).to redirect_to login_path
    end
  end

  describe "GET /users/:id/edit" do
    it "ログインしていないとユーザ編集ができないこと" do
      get edit_user_path(create(:user, :a))
      expect(response).to redirect_to login_path
    end

  end

  describe "PATCH /users/:id" do
    it "ログインしていないとユーザ更新ができないこと" do
      patch user_path(create(:user, :a, name: "another-user", email: "another@user.com"))
      expect(response).to redirect_to login_path
    end
  end
  
  describe "DELETE /users/:id" do
    it "管理者権限でないとユーザ削除ができないこと" do
      # 後で書く
    end
  end
  
  describe "GET /users/:id/following" do
    it "ログインしていないとフォローができないこと" do
      get following_user_path(create(:user, :a))
      expect(response).to redirect_to login_path
    end
  end

  describe "GET /users/:id/followers" do
    it "ログインしていないとフォローがされないこと" do
      get followers_user_path(create(:user, :a))
      expect(response).to redirect_to login_path
    end
  end
  
end
