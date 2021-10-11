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

  module DSLOverride
    extend ActiveSupport::Concern

    def setting(name, default:, description:, full_name: nil, value: nil, collection: nil, encrypted: false, **options)
      branded_default = Setting.branded_settings[name.to_s]
      default = branded_default if branded_default

      super(
        name,
        default: default,
        description: description,
        full_name: full_name,
        value: value,
        collection: collection,
        encrypted: encrypted,
        **options
      )
    end
  end

  module ProvisioningExtension
    def default_settings
      super + [
        set(
          'show_unsupported_templates',
          N_('Show unsupported provisioning templates. When enabled, all the avaiable templates will be shown. When disabled, Red Hat supported templates will be shown only'),
          false,
          N_('Show unsupported provisioning templates')
        )
      ]
    end
  end
end
