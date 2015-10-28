require 'test_plugin_helper'

class ModelsTest < ActiveSupport::TestCase

  test "check openstack friendly name" do
    assert_equal Foreman::Model::Openstack::provider_friendly_name, "RHEL OpenStack Platform", "Friendly name override was unsuccessful"
  end

  test "check ovirt friendly name" do
    assert_equal Foreman::Model::Ovirt::provider_friendly_name, "RHEV", "Friendly name override was unsuccessful"
  end

  test "check realms types" do
    assert_equal Realm::TYPES, ["Red Hat Identity Management", "Active Directory"]
  end
end
