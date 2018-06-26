require 'test_plugin_helper'
require __dir__ + '/../../db/migrate/20180605150932_deprecate_satellite_templates.rb'

class DeprecateSatTemplatesMigrationTest < ActiveSupport::TestCase
  test 'copies new associations' do
    old_template = FactoryBot.create(:provisioning_template, name: 'Satellite Kickstart Default')
    new_template = FactoryBot.create(:provisioning_template, name: 'Kickstart default')

    FactoryBot.create(:template_combination, provisioning_template: old_template)
    FactoryBot.create(:os_default_template, provisioning_template: old_template)

    DeprecateSatelliteTemplates.new.up

    old_template.reload
    new_template.reload
    assert_equal 1, new_template.template_combinations.count
    assert_equal 1, new_template.os_default_templates.count
    assert_equal 'DEPRECATED Satellite Kickstart Default', old_template.name
  end

  test 'ignores old associations' do
    old_template = FactoryBot.create(:provisioning_template, name: 'Satellite Kickstart Default')
    new_template = FactoryBot.create(:provisioning_template, name: 'Kickstart Default')

    old_combination = FactoryBot.create(:template_combination, provisioning_template: old_template)

    FactoryBot.create(:template_combination, provisioning_template: new_template, environment_id: old_combination.environment_id, hostgroup_id: old_combination.hostgroup_id)

    DeprecateSatelliteTemplates.new.up

    old_template.reload
    new_template.reload
    assert_equal 1, new_template.template_combinations.count
  end
end
