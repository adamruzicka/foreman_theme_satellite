# frozen_string_literal: true

# Overrides for functions used in helpers.
module ThemeExternalLogoutHelper
  def external_logout_props
    super.merge(
      version: ForemanThemeSatellite::SATELLITE_VERSION,
      logoSrc: image_path('login_logo.svg')
    )
  end
end
