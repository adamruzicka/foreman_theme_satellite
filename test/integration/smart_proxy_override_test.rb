require 'test_plugin_helper'

class SmartProxyOverrideIntegrationTest < ActionDispatch::IntegrationTest
  test "index page" do
    assert_index_page(smart_proxies_path, "capsules", "New Capsule", false)
  end

  test "create new page" do
    assert_new_button(smart_proxies_path, "New Capsule", new_smart_proxy_path)
    fill_in "smart_proxy_name", :with => "DNS Worldwide"
    fill_in "smart_proxy_url", :with => "http://dns.example.com"
    assert_submit_button(smart_proxies_path)
    assert page.has_link? "DNS Worldwide"
    assert page.has_content? "http://dns.example.com"
  end
end
