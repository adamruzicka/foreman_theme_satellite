require_relative '../../../lib/foreman_theme_satellite/documentation'

module DocumentationControllerBranding
  extend ActiveSupport::Concern

  def documentation_url(section = nil, options = {})
    url = ''
    unless section.nil?
      ForemanThemeSatellite::Documentation::USER_GUIDE_DICTIONARY.each do |key, val|
        url = val if section.include? key
      end
    end
    if url.empty?
      upstream_url = super(section, options)
      if (upstream_url =~ /redhat.com/)
        url = upstream_url
      else
        url = "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite"
      end
    end
    url
  end


end
