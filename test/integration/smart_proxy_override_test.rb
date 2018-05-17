require 'test_plugin_helper'
require 'integration_test_helper'

class SmartProxyOverrideIntegrationTest < ActionDispatch::IntegrationTest
  test "index page" do
    assert_index_page(smart_proxies_path, "Capsules", "Create Capsule", false)
  end

  test "create new page" do
    assert_new_button(smart_proxies_path, "Create Capsule", new_smart_proxy_path)
  end
end
