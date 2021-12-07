module DistributorVersion
  extend ActiveSupport::Concern

  included do
    const_set(:DISTRIBUTOR_VERSION, "sat-#{Foreman::Version.new(ForemanThemeSatellite::SATELLITE_VERSION).major}".freeze)
  end
end
