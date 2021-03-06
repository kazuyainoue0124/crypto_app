require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Crypto App for Portfolio"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "ホーム | #{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "本アプリについて | #{@base_title}"
  end
end
