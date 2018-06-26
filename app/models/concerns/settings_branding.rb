# Responsible for silently overwriting setting's default value.
module SettingsBranding
  def branded_settings
    domain = SETTINGS[:domain]
    @branded_settings ||= {
      'email_reply_address' => "satellite-noreply@#{domain}",
      'email_subject_prefix' => '[satellite]',

      'rss_url' => 'https://access.redhat.com/blogs/1169563/feed'
    }.freeze
  end

  def create!(opts)
    branded_default = branded_settings[opts[:name]]
    opts[:default] = branded_default if branded_default

    super(opts)
  end
end
