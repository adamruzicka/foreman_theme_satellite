# Responsible for silently overwriting setting's default value.
module SettingsBranding
  extend ActiveSupport::Concern
  included do |klass|
    class << klass
      alias_method_chain :create!, :theme
    end
  end

  module ClassMethods
    def branded_settings
      domain = Facter.value(:domain) || SETTINGS[:domain]
      @branded_settings ||= {
        'email_reply_address' => "satellite-noreply@#{domain}",
        'email_subject_prefix' => '[satellite]',

        'katello_default_provision' => 'Satellite Kickstart Default',
        'katello_default_finish' => 'Satellite Kickstart Default Finish',
        'katello_default_user_data' => 'Satellite Kickstart Default User Data',
        'katello_default_PXELinux' => 'Kickstart default PXELinux',
        'katello_default_iPXE' => 'Kickstart default iPXE',
        'katello_default_ptable' => 'Kickstart default',
        'katello_default_kexec' => 'Discovery Red Hat kexec',
        'katello_default_atomic_provision' => 'Satellite Atomic Kickstart Default'
      }.freeze
    end

    def create_with_theme!(opts)
      branded_default = branded_settings[opts[:name]]
      opts[:default] = branded_default if branded_default

      create_without_theme!(opts)
    end
  end

end
