require 'fast_gettext'
require 'gettext_i18n_rails'
require 'rubygems'
require 'deface'

module ForemanThemeSatellite
  class Engine < ::Rails::Engine
    engine_name 'foreman_theme_satellite'
    config.autoload_paths += Dir["#{config.root}/app/overrides"]
    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    engine_peth = config.root

    assets_to_override = ["#{engine_peth}/app/assets/images"]

    if ENV['ENABLE_PRY_RACK'] == 'true'
      require File.expand_path("../pry_rack.rb", __FILE__)
      config.app_middleware.insert_before(::ActionDispatch::Static, PryRack)
    end

    config.app_middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{config.root}/public")

    initializer 'foreman_theme_satellite.load_default_settings', :before => :load_config_initializers do |app|
      Setting.singleton_class.prepend SettingsBranding
    end


    initializer 'foreman_theme_satellite.register_gettext', :after => :load_config_initializers do
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_theme_satellite'

      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    initializer 'foreman_theme_satellite.register_plugin', :before=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_theme_satellite do
        requires_foreman '>= 1.10'
         tests_to_skip ({
                        "ComputeResourceTest" => ["friendly provider name"],
                        "RealmIntegrationTest" => ["create new page"],
                        "SmartProxyIntegrationTest" => ["create new page", "index page"],
                        "TopBarIntegrationTest" => ["top bar links"],
                        "AboutIntegrationTest" => ["about page"],
                        "ComputeProfileIntegrationTest" => ["index page", "create new page", "edit page", "show page", "edit compute attribute page", "new compute attribute page"] ,

                        #the following tests are failing due to change in realms types
                        "Api::V2::RealmsControllerTest" => ["should create valid realm", "should update valid realm"],
                        "OrganizationTest" => ["should clone organization with all associations"],
                        "RealmTest" => ["realm can be assigned to locations"],
                        "LocationTest" => ["should clone location with all associations"]
                       })
      end
    end

    initializer 'foreman_theme_satellite.load_app_instance_data' do |app|
      ForemanThemeSatellite::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    # Precompile any JS or CSS files under app/assets/
    # If requiring files from each other, list them explicitly here to avoid precompiling the same
    # content twice.
    assets_to_precompile =
        Dir.chdir(root) do
          Dir['app/assets/stylesheets/**/*', 'app/assets/images/**/*', 'app/assets/javascripts/**/*'].map do |f|
            f.split(File::SEPARATOR, 4).last
          end
        end

    initializer 'foreman_theme_satellite.configure_assets', group: :assets do
      SETTINGS[:foreman_theme_satellite] = { assets: { precompile: assets_to_precompile } }
      assets_to_override.each { |path| Rails.application.config.assets.paths.unshift path }
    end

    initializer 'foreman_theme_satellite.assets.precompile' do |app|
      app.config.assets.precompile += assets_to_precompile
      app.config.assets.precompile << 'theme_client_side_branding.js'
    end

    initializer 'foreman_theme_satellite.gettext.branding', :before=> :finisher_hook do |app|
      require File.expand_path('../replacer_repository', __FILE__)
      FastGettext.translation_repositories.each do |key, repo|
        FastGettext.translation_repositories[key] = ::ForemanThemeSatellite::ReplacerRepository.new(repo)
      end
    end

    #Include concerns in this config.to_prepare block
    config.to_prepare do
      if defined?(Sass)
        Rails.application.config.assets.precompile += %w( theme.css )
        Rails.application.config.sass.load_paths << "#{engine_peth}/app/assets/stylesheets"
        assets_to_override.each { |path| Rails.application.config.assets.paths.unshift path }
      end
      begin
        # Include your monkey-patches over here
        Foreman::Model::Openstack.send :include, Openstack
        Foreman::Model::Ovirt.send :include, Ovirt
        Realm.send :include, RealmTheme
        Setting.send :include, SettingsBranding
        Katello::Ping.send :include, SatellitePackages
      rescue => e
        puts "ForemanThemeSatellite: skipping engine hook (#{e.to_s})"
      end
    end
  end
end
