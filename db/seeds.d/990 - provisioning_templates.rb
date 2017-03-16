::User.current = ::User.anonymous_api_admin

# Provisioning Templates

kinds = [:provision, :finish, :user_data].inject({}) do |hash, kind|
  hash[kind] = TemplateKind.find_by(:name => kind)
  hash
end

templates = [{:name => "Satellite Kickstart Default",           :source => "kickstart-katello.erb",      :template_kind => kinds[:provision]},
             {:name => "Satellite Kickstart Default User Data", :source => "userdata-katello.erb",       :template_kind => kinds[:user_data]},
             {:name => "Satellite Kickstart Default Finish",    :source => "finish-katello.erb",         :template_kind => kinds[:finish]},
             {:name => "subscription_manager_registration",     :source => "snippets/_subscription_manager_registration.erb", :snippet => true},
             {:name => "idm_register",                          :source => "snippets/idm_register.erb",  :snippet => true},
             {:name => "Satellite Atomic Kickstart Default",    :source => "kickstart-katello-atomic.erb", :template_kind => kinds[:provision]}]

templates.each do |template|
  template[:template] = File.read(File.join(ForemanThemeSatellite::Engine.root, "app/views/foreman/unattended", template.delete(:source)))
  ProvisioningTemplate.where(:name => template["name"]).first_or_create do |pt|
    pt.vendor = "Satellite"
    pt.default = true
    pt.locked = true
    pt.name = template[:name]
    pt.template = template[:template]
    pt.template_kind = template[:template_kind] if template[:template_kind]
    pt.snippet = template[:snippet] if template[:snippet]
  end
  ProvisioningTemplate.find_by(name: template[:name]).update_attributes!(:template => template[:template], :vendor => "Satellite")
end

# Ensure all default templates are seeded into the first org and loc
ProvisioningTemplate.where(:default => true).each do |template|
  template.organizations << Organization.first unless template.organizations.include?(Organization.first) || Organization.count.zero?
  if Location.exists? && !template.location_ids.include?(Location.default_location_ids)
    template.location_ids << Location.default_location_ids
  end
end

Operatingsystem.all.each(&:assign_templates!)

# remove upstream templates
upstream_templates = [
  'Katello Kickstart Default',
  'Katello Kickstart Default User Data',
  'Katello Kickstart Default Finish',
  'Katello Atomic Kickstart Default',
  'Kickstart RHEL default',
  'Kickstart default'
]
ProvisioningTemplate.where(:name => upstream_templates).each do |template|
  template.destroy if template.template_combinations.count == 0 && template.operatingsystems.count == 0 && template.os_default_templates.count == 0
end

::User.current = nil
