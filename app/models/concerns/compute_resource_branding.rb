module ComputeResourceBranding
  module ClassMethods
    def supported_providers
      super.except('Rackspace')
    end
  end
end
