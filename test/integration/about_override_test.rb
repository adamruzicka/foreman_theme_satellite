require 'test_plugin_helper'


class AboutOverrideIntegrationTest < ActionDispatch::IntegrationTest
  test "about page" do
    visit about_index_path
    assert_index_page(about_index_path,"About", nil, false, false)
    assert page.has_selector?('h4', :text => "System Status"), "System Status was expected in the <h4> tag, but was not found"
    assert page.has_selector?('h4', :text => "Support"), "Support was expected in the <h4> tag, but was not found"
    assert page.has_selector?('h4', :text => "System Information"), "System Information was expected in the <h4> tag, but was not found"
    assert page.has_selector?("p", :text => "Includes Foreman © 2009-#{DateTime.now.year} Paul Kelly and Ohad Levy")
    assert page.has_link?(_("Smart Proxies"), :href => "#smart_proxies")
    assert page.has_link?(_("Compute Resources"), :href => "#compute_resources")
    assert page.has_content?("Red Hat Inc.")
    assert page.has_selector?("p#sat-copyright-p")
  end
end
