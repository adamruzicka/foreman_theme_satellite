# Responsible for silently overwriting setting's default value.
module SettingsBranding
  module ClassMethods
    def branded_settings
      domain = SETTINGS[:domain]
      @branded_settings ||= {
        'email_reply_address' => "satellite-noreply@#{domain}",
        'email_subject_prefix' => '[satellite]',

        'rss_url' => 'https://www.redhat.com/en/rss/blog/channel/red-hat-satellite',
        'foreman_tasks_troubleshooting_url' => 'https://access.redhat.com/solutions/satellite6-tasks#%{label}',
        'bootdisk_allowed_types' => ['subnet','full_host']
      }.freeze
    end

    def create_existing(setting, opts)
      branded_default = branded_settings[setting.name]
      opts[:default] = branded_default if branded_default

      super(setting, opts)
    end

    def create!(opts)
      branded_default = branded_settings[opts[:name]]
      opts[:default] = branded_default if branded_default

      super(opts)
    end
  end
end
