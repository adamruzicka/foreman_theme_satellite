module ThemeApplicationHelper

  USER_GUIDE_DICTIONARY = {
    "ExecutingaJob" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/sect-host_configuration_guide-configuring_and_running_remote_commands#sect-Host_Configuration_Guide-Executing_Remote_Jobs",
    "JobTemplates" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/sect-host_configuration_guide-configuring_and_running_remote_commands#sect-Host_Configuration_Guide-Setting_up_Job_Templates",
    "FactsandtheENC" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-storing_and_maintaining_host_information#sect-Red_Hat_Satellite-Host_Configuration_Guide-Using_Facter_and_Facts-Searching_for_Hosts_based_on_Facts",
    "Architectures" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Architectures",
    "Provisioning" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning-guide/",
    "PuppetReports" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/",
    "Realm" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/server_administration_guide/sect-red_hat_satellite-server_administration_guide-configuring_external_authentication-external_authentication_for_provisioned_hosts",
    "Searching" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/",
    "InstallationMedia" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Installation_Media",
    "ParameterizedClasses" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-parameters",
    "PartitionTables" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Partition_Tables",
    "ProvisioningTemplates" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Provisioning_Templates",
    "OperatingSystems" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Operating_Systems",
    "RolesandPermissions" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/server_administration_guide/sect-red_hat_satellite-server_administration_guide-users_and_roles-creating_and_managing_roles",
    "Parameters" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-parameters",
    "GettingHelp" => "https://access.redhat.com/products/red-hat-satellite/#support",
    "LDAPAuthentication" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/server_administration_guide/sect-red_hat_satellite-server_administration_guide-creating_user_groups-configuring_external_user_groups",
    "VMwareNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_vmware_vsphere",
    "RackspaceNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "RHEVNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_red_hat_enterprise_virtualization",
    "OpenStackNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_cloud_instances_in_red_hat_openstack_platform",
    "LibvirtNote" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_kvm",
    "EC2" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_cloud_instances_in_amazon_ec2",
    "GoogleComputeEngineNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "ComputeResources" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-configuring_provisioning_settings#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "SmartProxies" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/installation_guide/installing_capsule_server",
    "SmartVariables" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-parameters#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Smart_Variables",
    "ConfigurationOptions" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/",
    "Classes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-red_hat_satellite-host_configuration_guide-configuring_the_provisioning_environment-parameters#sect-Red_Hat_Satellite-Host_Configuration_Guide-Importing_Parameterized_Classes_from_a_Puppet_Master",
    "Environments" => "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide/",
    "Bookmarks" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host_configuration_guide/sect-Red_Hat_Satellite-Host_Configuration_Guide-Searching_and_Bookmarking"
  }

  def association_text()
    content_tag(:p, _("When editing a Template, you must assign a list of Operating Systems with which this Template can be used. Optionally, you can restrict a template to a list of Hostgroups or Environments.")) +
      content_tag(:p, _("When a Host requests a template (e.g. during provisioning), Foreman selects the optimal match from the available templates of that type, in the following order:")) +
      (content_tag :ul do
        content_tag(:li, _("Host group and Environment"))
        content_tag(:li, _("Host group only"))
        content_tag(:li, _("Environment only"))
        content_tag(:li, _("Operating system default"))
      end)
    (_("The final entry, Operating System default, can be set by editing the %s page.") % (link_to _("Operating System"), operatingsystems_path)).html_safe
  end

  def documentation_url(section = nil, _ = {})
    url = ""
    # this version string can be changed if needed.
    unless section.nil?
      USER_GUIDE_DICTIONARY.each do |key,val|
        url = val if section.include? key
      end
    end
    if url.empty?
      url = "https://access.redhat.com/documentation/en-us/red-hat-satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/host-configuration-guide"
    end
    url
  end
end
