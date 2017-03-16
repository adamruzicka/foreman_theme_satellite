require 'test_plugin_helper'
require 'integration_test_helper'

class LoginIntegrationTest < ActionDispatch::IntegrationTest
  test "login page has correct text" do
    visit 'users/login'
    assert page.has_selector?('p', :text => "Welcome to Satellite"), "Translation changes didn't work"
  end
end
