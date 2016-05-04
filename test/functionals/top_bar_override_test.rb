require 'test_plugin_helper'

class TopBarOverrideIntegrationTest < ActionController::TestCase
  tests DashboardController

  test "top bar links" do
    get :index, {}, set_session_user

    assert_select "div.navbar-outer a[href='/']"
    assert_select "div.navbar-inner a[href='/hosts']"
  end

end
