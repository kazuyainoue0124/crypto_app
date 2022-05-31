require 'rails_helper'

RSpec.describe "Bookmarks", type: :system do
  before do
    @user1 = create(:user, :a)
    @entry1 = create(:entry, :a)
  end

  context 'ブックマーク、ブックマーク解除' do
    it 'user1がentry1をブックマーク、ブックマーク解除する' do
      log_in_as(@user1)
      visit entry_path(@entry1)

      # entry1をブックマークする
      find('.fa-star-o').click
      expect(page).to have_selector '.fa-star'
      expect(@user1.bookmarks.count).to eq(1)
      expect(@entry1.bookmarks.count).to eq(1)
      
      # entry1をブックマーク解除する
      find('.fa-star').click
      expect(page).to have_selector '.fa-star-o'
      expect(@user1.bookmarks.count).to eq(0)
      expect(@entry1.bookmarks.count).to eq(0)
    end
  end
end
