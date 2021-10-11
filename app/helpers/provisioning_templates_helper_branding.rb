module ProvisioningTemplatesHelperBranding
  def link_to_if_authorized(name, options = {}, html_options = {})
    return super unless ProvisioningTemplatesControllerBranding::SUPPORTED_PROVISIONING_TEMPLATES.include?(name.name)

    image_tag(
      'Redhat.png',
      class: 'prov-brand-img',
      title: _('Supported by Red Hat')
    ).safe_concat(super)
  end
end
