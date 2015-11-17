require 'test_plugin_helper'

class LoginIntegrationTest < ActionDispatch::IntegrationTest
  test "login page has correct text" do
    visit 'users/login'
    assert page.has_selector?('strong', :text => "Welcome to Satellite"), "Translation changes didn't work"
  end
end


