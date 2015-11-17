require 'test_plugin_helper'

class TopBarOverrideIntegrationTest < ActionDispatch::IntegrationTest
  def setup
    FactoryGirl.create(:fact_value, :value => '2.6.9',:host => FactoryGirl.create(:host),
                       :fact_name => FactoryGirl.create(:fact_name) )
  end

  test "top bar links" do
    visit root_path
    within("div.navbar-outer") do
      # link was changed
      assert page.has_link?("", :href => "/")
    end
    within("div.navbar-inner") do
      assert page.has_link?("Dashboard", :href => "/dashboard")
      assert page.has_link?("All hosts", :href => "/hosts")
      assert page.has_link?("Config management", :href => "/config_reports?search=eventful+%3D+true")
      assert page.has_link?("Facts", :href => "/fact_values")
      assert page.has_link?("Audits", :href => "/audits")
      assert page.has_link?("Statistics", :href => "/statistics")
      assert page.has_link?("Trends", :href => "/trends")
    end
  end

end
