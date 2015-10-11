require 'rubygems'
require 'deface'
require 'debugger'


module ForemanThemeSatellite

  class Engine < ::Rails::Engine
    engine_name 'foreman_theme_satellite'

    config.to_prepare do
      ApplicationController.helper(ThemeLayoutHelper)
    end

    config.autoload_paths += Dir["#{config.root}/app/overrides"]
    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers"]

    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    # Add any db migrations
    initializer "foreman_theme_satellite.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += ForemanThemeSatellite::Engine.paths['db/migrate'].existent
      # app.config.railties_order = [ForemanThemeSatellite::Engine, :main_app, :all]

    end


    initializer 'foreman_theme_satellite.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_theme_satellite do
        requires_foreman '>= 1.4'
        role "ForemanThemeSatellite", [:view_foreman_theme]

      end
    end

    # Precompile any JS or CSS files under app/assets/
    # If requiring files from each other, list them explicitly here to avoid precompiling the same
    # content twice.
    assets_to_precompile =
      Dir.chdir(root) do
        Dir['app/assets/javascripts/**/*', 'app/assets/stylesheets/**/*'].map do |f|
          f.split(File::SEPARATOR, 4).last
        end
      end
    initializer 'foreman_theme_satellite.assets.precompile' do |app|
      app.config.assets.precompile += assets_to_precompile
    end
    initializer 'foreman_theme_satellite.configure_assets', :group => :assets do
      SETTINGS[:foreman_theme_satellite] = {:assets => {:precompile => assets_to_precompile}}

      assets_to_override =
        Dir.chdir(root) do
          Dir['app/assets/images'].map do |f|
            f.split(File::SEPARATOR, 4).last
          end
        end
      Rails.application.assets.prepend_path assets_to_override
    end

    initializer 'foreman_theme_satellite.override_assets' do |app|
      assets_to_override =
        Dir.chdir(Gem.loaded_specs['foreman_theme_satellite'].full_gem_path) do
          Dir['app/assets/**'].map { |d| File.absolute_path d }
        end
      assets_to_override.each { |path| app.assets.prepend_path path }
    end


    #Include concerns in this config.to_prepare block
    config.to_prepare do
      begin

        # ProvisioningTemplatesHelper.send :include, ConfigTemplatesThemeHelper
        # ThemeLayoutHelper.send :include, ThemeLayoutHelper::Theme
        # Foreman::Controller::SmartProxyAuth.send :include, SmartProxyAuth
        # ApplicationController.helper(ThemeLayoutHelper)
        ::ApplicationHelper.send(:include, ThemeApplicationHelper)
        ::LayoutHelper.send(:include, ThemeLayoutHelper)
        Foreman::Model::Openstack.send :include, Openstack
         Foreman::Model::Ovirt.send :include, Ovirt
         Realm.send :include, RealmTheme
        #
        # Host::Managed.send(:include, ForemanThemeSatellite::HostExtensions)
        # HostsHelper.send(:include, ForemanThemeSatellite::HostsHelperExtensions)
      rescue => e
        puts "ForemanThemeSatellite: skipping engine hook (#{e.to_s})xxxxxxxxxxxxxxxx"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanThemeSatellite::Engine.load_seed
      end
    end

    initializer 'foreman_theme_satellite.register_gettext', :after => :load_config_initializers do |app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_theme_satellite'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    initializer 'foreman_theme_satellite.overrides' do |app|

      # pre pending plugin path to the sass @import method in order for it to search foreman_theme_satellite for files before it does it in the local dir
      Rails.application.config.sass.load_paths << "#{config.root}/app/assets/stylesheets"
      #adding the override method "include_foreman" to sprockets engine
      require "directive_processor"
      Rails.application.assets.unregister_processor('text/css', Sprockets::DirectiveProcessor)
      Rails.application.assets.unregister_processor('application/javascript', Sprockets::DirectiveProcessor)
      # registering the new engine override
      Rails.application.assets.register_processor('text/css', ForemanThemeSatellite::OverrideAssets::DirectiveProcessor)
      Rails.application.assets.register_processor('application/javascript', ForemanThemeSatellite::OverrideAssets::DirectiveProcessor)
    end

  end

end