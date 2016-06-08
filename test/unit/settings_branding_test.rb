require 'test_plugin_helper'

class SettingsBrandingTest < ActiveSupport::TestCase
  describe 'stubbed creation' do
    teardown do
      Setting::General.unstub(:create_existing)
    end

    test 'it replaces value to a branded one' do
      Setting::General.expects(:create_existing).with{ |s, opts|
        opts[:default] == Setting.branded_settings['email_subject_prefix']
      }
      props = Setting::General.set('email_subject_prefix', N_("Prefix to add to all outgoing email"), '[foreman]', N_('Email subject prefix'))
      Setting::General.create! props.update(:category => "Setting::General")
    end
  end
end
