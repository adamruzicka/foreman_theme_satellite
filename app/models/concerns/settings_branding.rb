# Responsible for silently overwriting setting's default value.
module SettingsBranding
  def branded_settings
    domain = SETTINGS[:domain]
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
      'katello_default_atomic_provision' => 'Satellite Atomic Kickstart Default',
      'rss_url' => 'https://access.redhat.com/blogs/1169563/feed'
    }.freeze
  end

  def create!(opts)
    branded_default = branded_settings[opts[:name]]
    opts[:default] = branded_default if branded_default

    super(opts)
  end
end
