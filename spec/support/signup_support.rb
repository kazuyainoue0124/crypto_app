module SignUpSupport
  def sign_up(user)
    visit root_path
    visit signup_path
    fill_in 'user[name]', with: user.name
    fill_in "user[email]",	with: user.email
    fill_in "user[password]",	with: user.password
    fill_in "user[password_confirmation]",	with: user.password_confirmation
    fill_in "user[profile]",	with: user.profile
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end

RSpec.configure do |config|
  config.include SignUpSupport
end