require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:base_title) { 'Crypto App for Portfolio' }

  describe "GET /sessions/new" do
    it "ログインページが正しく表示されること" do
      get login_path
      expect(response).to have_http_status(200)
      assert_select "title", "ログイン | #{base_title}"
    end
  end
end
