class KatelloSetting < Setting
  def self.load_defaults
    # Check the table exists
    return unless super

    settings_to_override = {
      'katello_default_provision' => 'Satellite Kickstart Default',
      'katello_default_finish' => 'Satellite Kickstart Default Finish',
      'katello_default_user_data' => 'Satellite Kickstart Default User Data',
      'katello_default_PXELinux' => 'Kickstart default PXELinux',
      'katello_default_iPXE' => 'Kickstart default iPXE',
      'katello_default_ptable' => 'Kickstart default',
      'katello_default_kexec' => 'Discovery Red Hat kexec',
      'katello_default_atomic_provision' => 'Satellite Atomic Kickstart Default'
    }

    transaction do
      settings_to_override.each do |setting, default|
        setting = Setting.where(:name => setting).first
        setting.update_attribute(:default, default)
      end
    end

    true
  end
end
