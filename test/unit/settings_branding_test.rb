require 'test_plugin_helper'

class SettingsBrandingTest < ActiveSupport::TestCase
  describe 'stubbed creation' do

    test 'it replaces value to a branded one using DSL' do
      Setting.where(name: 'dsl_setting').delete_all
      branded_settings = Foreman.settings.branded_settings.deep_dup
      branded_settings['dsl_setting'] = 'TEST_VALUE'
      Foreman.settings.stubs(:branded_settings).returns(branded_settings)

      Foreman::SettingManager.define('TEST_ID') do
        category(:General) do
          setting(
            :dsl_setting,
            description: N_("Testing settings DSL for branding"),
            default: '[foreman]',
            full_name: N_('DSL test setting'),
            type: :string
          )
        end
      end

      Foreman.settings.load

      # Assert that the value is properly branded despite the definition.
      assert_equal 'TEST_VALUE', Setting['dsl_setting']
    end

  end
end
