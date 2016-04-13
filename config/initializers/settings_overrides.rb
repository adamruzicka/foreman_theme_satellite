# The class must be executed after Setting::General finished.
# Best way to achieve that is to inherit from the class
class GeneralSetting < ::Setting::General
  def self.load_defaults
    # Check the table exists
    return unless super

    domain = Facter.value(:domain) || SETTINGS[:domain]
    settings_to_override = {
      'email_reply_address' => "satellite-noreply@#{domain}",
      'email_subject_prefix' => '[satellite]'
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
