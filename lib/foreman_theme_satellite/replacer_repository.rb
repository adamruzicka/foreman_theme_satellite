require 'fast_gettext'

module ForemanThemeSatellite
  # This repository is a wrapper above other repository,
  # it replaces branded words with their downstream counterparts.
  class ReplacerRepository < ::FastGettext::TranslationRepository::Base
    FOREMAN_BRAND = {
      /\bForeman\b(?!-)/       => 'Satellite',
      /\bforeman\b(?!-)/       => 'satellite',
      /\bsmart-proxy\b(?!-)/   => 'capsule',
      /\bSmart-proxy\b(?!-)/   => 'Capsule',
      /\bsmart proxies\b(?!-)/ => 'capsules',
      /\bSmart proxies\b(?!-)/ => 'Capsules',
      /\bsmart-proxies\b(?!-)/ => 'capsules',
      /\bSmart-proxies\b(?!-)/ => 'Capsules',
      /\bSmart Proxies\b(?!-)/ => 'Capsules',
      /\bSmart Proxy\b(?!-)/   => 'Capsule',
      /\bsmart proxy\b(?!-)/   => 'capsule',
      /\bSmart-Proxies\b(?!-)/ => 'Capsules',
      /\bSmart proxy\b(?!-)/   => 'Capsule',
      /\bSmart-Proxy\b(?!-)/   => 'Capsule',
      /\boVirt\b(?!-)/         => 'RHEV',
      /\bovirt\b(?!-)/         => 'RHEV',
      /\bOvirt\b(?!-)/         => 'RHEV',
      /\bFreeIPA\b(?!-)/       => 'Red Hat Identity Management',
      /\bOpenStack\b(?!-)/     => 'RHEL OpenStack Platform',
      /\bopenstack\b(?!-)/     => 'RHEL OpenStack Platform',
      /\bOpenstack\b(?!-)/     => 'RHEL OpenStack Platform',
      /\bProxy\b(?!-)/         => 'Capsule',
      /\bproxy\b(?!-)/         => 'Capsule',
      /\bProxies\b(?!-)/       => 'Capsules',
      /\bproxies\b(?!-)/       => 'Capsules' }.freeze

    def initialize(old_repo)
      @repo = old_repo
    end

    def pluralisation_rule
      @repo.pluralisation_rule
    end

    def available_locales
      @repo.available_locales
    end

    def [](key)
      original = @repo[key]
      val = original || key
      return original unless val.is_a? String
      val = val.dup if val

      replaced = nil
      FOREMAN_BRAND.each do |foreman_word, value|
        replaced ||= val.gsub!(foreman_word, value) if val
      end
      replaced ? val : original
    end

    def plural(*keys)
      @repo.plural(*keys)
    end

    def reload
      @repo.reload
    end
  end
end
