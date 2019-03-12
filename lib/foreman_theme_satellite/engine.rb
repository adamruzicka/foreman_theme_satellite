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

    # Precompile any JS or CSS files under app/assets/
    # If requiring files from each other, list them explicitly here to avoid precompiling the same
    # content twice.
    assets_to_precompile =
        Dir.chdir(root) do
          Dir['app/assets/stylesheets/**/*', 'app/assets/images/**/*', 'app/assets/javascripts/**/*'].map do |f|
            f.split(File::SEPARATOR, 4).last
          end
        end
    assets_to_precompile << 'theme.css'

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

        precompile_assets(assets_to_precompile)
      end
    end

    initializer 'foreman_theme_satellite.load_app_instance_data' do |app|
      ForemanThemeSatellite::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_theme_satellite.gettext.branding', :before => :finisher_hook do |app|
      require File.expand_path('../replacer_repository', __FILE__)
      FastGettext.translation_repositories.each do |key, repo|
        FastGettext.translation_repositories[key] = ::ForemanThemeSatellite::ReplacerRepository.new(repo)
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        assets_to_override.each { |path| Rails.application.config.assets.paths.unshift path }
        # Include your monkey-patches over here
        Foreman::Model::Openstack.send :include, Openstack
        Foreman::Model::Ovirt.send :include, Ovirt
        Realm.send :include, RealmTheme
        Setting.send :include, SettingsBranding
        Katello::Ping.send :include, SatellitePackages
      rescue => e
        puts "ForemanThemeSatellite: skipping engine hook (#{e})"
      end
    end
  end

  METADATA_PATH = '/usr/share/satellite/metadata.yml'.freeze

  def self.metadata_field(key, default)
    value = ENV["SATELLITE_#{key.upcase}"]
    return value if value

    metadata_path = Rails.env.production? ? METADATA_PATH : "#{__dir__}/../../config/metadata.yml"

    @metadata_yaml ||= File.exist?(metadata_path) ? YAML.load_file(metadata_path) : {}
    @metadata_yaml[key] || default
  end

  def self.get_satellite_version
    metadata_field('version', '0.0.0-development')
  end

  def self.get_satellite_short_version
    Foreman::Version.new(SATELLITE_VERSION).short
  end

  def self.documentation_server
    @documentation_server ||= metadata_field('documentation_server', 'https://access.redhat.com')
  end

  def self.documentation_version
    @documentation_version ||= metadata_field('documentation_version', ForemanThemeSatellite::SATELLITE_SHORT_VERSION)
  end

  def self.documentation_root
    @documentation_root ||= begin
      "#{documentation_server}/documentation/en-us/red_hat_satellite/#{documentation_version}/html"
    end
  end

  # this file indicates the satellite version that will be represented on the login page.
  SATELLITE_VERSION = get_satellite_version

  # this file indicates the satellite version that will be used on links to documentation.
  SATELLITE_SHORT_VERSION = get_satellite_short_version
end
