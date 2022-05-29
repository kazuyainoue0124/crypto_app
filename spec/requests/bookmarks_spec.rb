require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do

  let(:base_title) { 'Crypto App for Portfolio' }
  describe "GET /users/:id/bookmarks" do
    it "ログインしていないとブックマークページが正しく表示されないこと" do
      user = create(:user, :a)
      get user_bookmarks_path(user)
      expect(response).to redirect_to login_path
    end
  end
end
