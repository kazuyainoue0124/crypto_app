require 'rails_helper'

RSpec.describe "Entries", type: :request do
  let(:base_title) { 'Crypto App for Portfolio' }

  describe "/" do
    it "ルートパスで記事一覧ページが正しく表示されること" do
      get root_path
      expect(response).to have_http_status(200)
      # expect(response.body).to match(/<title>ホーム | #{base_title}<\/title>/i)
      assert_select "title", "ホーム | #{base_title}"
    end
  end
  
  describe "GET /entries" do
    it "記事一覧ページが正しく表示されること" do
      get entries_path
      expect(response).to have_http_status(200)
      # expect(response.body).to match(/<title>ホーム | #{base_title}<\/title>/i)
      assert_select "title", "ホーム | #{base_title}"
    end
  end
  describe "GET /entries/:id" do
    it "記事詳細ページが正しく表示されること" do
      entry = create(:entry, :a)
      get entry_path(entry)
      expect(response).to have_http_status(200)
      # expect(response.body).to match(/<title>ホーム | #{base_title}<\/title>/i)
      assert_select "title", "#{entry.title} | #{base_title}"
    end
  end
end
