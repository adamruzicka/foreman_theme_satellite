module DeprecationNotification
  module StringParser
    def initialize(template, options = {})
      options[:version] = '6.8' if options[:version] == '2.0'
      super(template, options)
    end
  end

  module Notification
    def create!(opts)
      if opts[:notification_blueprint] == NotificationBlueprint.find_by_name('feature_deprecation') &&
        opts.dig(:actions, :links, 0, :href) == 'https://community.theforeman.org/t/dropping-smart-variables/16176'
        opts[:actions][:links][0][:href] = "#{ForemanThemeSatellite.documentation_root}/release_notes/index"
      end
      super(opts)
    end
  end
end
