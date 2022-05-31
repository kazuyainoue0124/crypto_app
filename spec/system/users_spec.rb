require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user, :a)
  end

  context '新規登録が成功する' do
    it '正しい情報を入力した場合、新規登録ができること' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit signup_path
      fill_in 'user[name]', with: @user.name
      fill_in "user[email]",	with: @user.email
      fill_in "user[password]",	with: @user.password
      fill_in "user[password_confirmation]",	with: @user.password_confirmation
      fill_in "user[profile]",	with: @user.profile
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq root_path
    end
  end
  
  context '新規登録が失敗する' do
    it '誤った情報を入力した場合、新規登録ができないこと' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit signup_path
      fill_in 'user[name]', with: ''
      fill_in "user[email]",	with: ''
      fill_in "user[password]",	with: ''
      fill_in "user[password_confirmation]",	with: ''
      fill_in "user[profile]",	with: ''
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq('/users')
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user, :a)
  end

  context 'ログインが成功する' do
    it  '正しい情報を入力した場合、ログインができること' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit login_path
      fill_in "session[email]",	with: @user.email
      fill_in "session[password]",	with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
    end
    
  end
  
  context 'ログインが失敗する' do
    it '誤った情報を入力した場合、新規登録ができないこと' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit login_path
      fill_in "session[email]",	with: ''
      fill_in "session[password]",	with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq login_path
    end
  end
end
