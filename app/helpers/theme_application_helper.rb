module ThemeApplicationHelper

  USER_GUIDE_DICTIONARY = {
    "ForemanRemoteExecution" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Executing_Remote_Jobs",
    "ExecutingaJob" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Executing_Remote_Jobs",
    "JobTemplates" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Setting_up_Job_Templates",
    "FactsandtheENC" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/puppet_guide/chap-red_hat_satellite-puppet_guide-storing_and_maintaining_host_information#sect-Red_Hat_Satellite-Puppet_Guide-Storing_and_Maintaining_Host_Information-Using_Facter_and_Facts",
    "Architectures" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Architectures",
    "Provisioning" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/",
    "PuppetReports" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-using_the_red_hat_satellite_content_dashboard",
    "Realm" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Configuring_External_Authentication-External_Authentication_for_Provisioned_Hosts",
    "Searching" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking",
    "InstallationMedia" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Installation_Media",
    "ParameterizedClasses" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/",
    "PartitionTables" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Partition_Tables",
    "ProvisioningTemplates" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Provisioning_Templates",
    "OperatingSystems" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Operating_Systems",
    "RolesandPermissions" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-users_and_roles",
    "Parameters" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/",
    "GettingHelp" => "https://access.redhat.com/products/red-hat-satellite/#support",
    "LDAPAuthentication" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication",
    "VMwareNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_vmware_vsphere",
    "RackspaceNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide",
    "RHEVNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_red_hat_virtualization",
    "OpenStackNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_cloud_instances_in_red_hat_openstack_platform",
    "LibvirtNote" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_kvm",
    "EC2" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_cloud_instances_in_amazon_ec2",
    "GoogleComputeEngineNotes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide",
    "ComputeResources" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/understanding_provisioning_basics",
    "SmartProxies" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/installation_guide/installing_capsule_server",
    "SmartVariables" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Configuring_Smart_Variables",
    "ConfigurationOptions" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/",
    "Trends" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-monitoring_resources#monitoring_trends",
    "Classes" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Importing_Parameterized_Classes_from_a_Puppet_Master",
    "Environments" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/",
    "Bookmarks" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Searching_and_Bookmarking-Bookmarking",
    "NoVNC" => "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/provisioning_guide/provisioning_virtual_machines_in_kvm#Provisioning_Virtual_Machines_in_KVM-Configuring_noVNC"
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
      url = "https://access.redhat.com/documentation/en-us/red_hat_satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/managing_hosts"
    end
    url
  end
end
