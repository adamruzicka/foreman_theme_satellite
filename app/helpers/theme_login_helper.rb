# frozen_string_literal: true

# Overrides for functions used in helpers.
module ThemeLoginHelper
  def login_props
    super.merge(
      version: ForemanThemeSatellite::SATELLITE_VERSION,
      logoSrc: image_path('foreman_theme_satellite/login_logo.svg')
    )
  end
end
