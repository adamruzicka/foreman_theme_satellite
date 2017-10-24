require 'fast_gettext'
require_relative 'branded_words'

module ForemanThemeSatellite
  # This repository is a wrapper above other repository,
  # it replaces branded words with their downstream counterparts.
  class ReplacerRepository < ::FastGettext::TranslationRepository::Base
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
      ForemanThemeSatellite::FOREMAN_BRAND.each do |foreman_word, value|
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
