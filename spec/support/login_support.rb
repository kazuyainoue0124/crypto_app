module LoginSupport
  def log_in_as(session)
    visit root_path
    visit login_path
    fill_in "session[email]",	with: session.email
    fill_in "session[password]",	with: session.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end