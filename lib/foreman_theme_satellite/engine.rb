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

    initializer 'foreman_theme_satellite.register_plugin', :after=> :finisher_hook do |app|
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

    # Precompile any JS or CSS files under app/assets/
    # If requiring files from each other, list them explicitly here to avoid precompiling the same
    # content twice.
    assets_to_precompile =
        Dir.chdir(root) do
          Dir['app/assets/stylesheets/**/*', 'app/assets/images/**/*'].map do |f|
            f.split(File::SEPARATOR, 4).last
          end
        end

    initializer 'foreman_theme_satellite.configure_assets', group: :assets do
      SETTINGS[:foreman_theme_satellite] = { assets: { precompile: assets_to_precompile } }
    end

    initializer 'foreman_theme_satellite.assets.precompile' do |app|
       app.config.assets.precompile += assets_to_precompile
    end

    #Include concerns in this config.to_prepare block
    config.to_prepare do
      Rails.application.config.sass.load_paths << "#{engine_peth}/app/assets/stylesheets"
      assets_to_override = [
                             "#{engine_peth}/app/assets/stylesheets",
                             "#{engine_peth}/app/assets/images"]
      assets_to_override.each { |path| Rails.application.config.assets.paths.unshift path }
      begin
        # Include your monkey-patches over here
        Foreman::Model::Openstack.send :include, Openstack
        Foreman::Model::Ovirt.send :include, Ovirt
        Realm.send :include, RealmTheme
      rescue => e
        puts "ForemanThemeSatellite: skipping engine hook (#{e.to_s})"
      end
    end
  end
end
