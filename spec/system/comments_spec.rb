require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user1 = create(:user, :a)
    @entry1 = create(:entry, :a)
  end

  context 'コメントを投稿' do
    it 'user1がentry1に対してコメントを投稿できること' do
      log_in_as(@user1)
      visit entry_path(@entry1)
      fill_in "comment[content]",	with: "Hello, world!"
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      expect(current_path).to eq entry_path(@entry1)
    end
  end
end
