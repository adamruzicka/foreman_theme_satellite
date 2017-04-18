module SatellitePackages
  extend ActiveSupport::Concern
  included do
    self.const_set(:PACKAGES, %w(katello candlepin pulp qpid foreman tfm hammer satellite))
  end
end

