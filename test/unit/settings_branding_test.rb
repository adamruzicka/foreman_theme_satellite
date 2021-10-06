require 'test_plugin_helper'

class SettingsBrandingTest < ActiveSupport::TestCase
  describe 'stubbed creation' do
    teardown do
      Setting.unstub(:create_existing)
    end

    test 'it replaces value to a branded one using models' do
      Setting.expects(:create_existing).with{ |s, opts|
        opts[:default] == Setting.branded_settings['email_subject_prefix']
      }
      props = Setting.set('email_subject_prefix', N_("Prefix to add to all outgoing email"), '[foreman]', N_('Email subject prefix'))
      Setting.create! props.update(:category => "Setting")
    end

    test 'it replaces value to a branded one using DSL' do
      Setting.where(name: 'dsl_setting').delete_all
      branded_settings = Setting.branded_settings.deep_dup
      branded_settings['dsl_setting'] = 'TEST_VALUE'
      Setting.stubs(:branded_settings).returns(branded_settings)

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
