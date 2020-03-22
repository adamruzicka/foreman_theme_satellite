module GCE
  module ClassMethods
    def image_families_to_filter
      @image_families_to_filter ||= ['rhel']
    end
  end
end
