module SettingBranding
  extend ActiveSupport::Concern

  class_methods do
    def replace_keywords(keyword)
      keyword&.gsub! '$VERSION', ForemanThemeSatellite::SATELLITE_VERSION
      super
    end
  end
end
