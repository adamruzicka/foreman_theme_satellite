module ThemeApplicationHelper

  USER_GUIDE_DICTIONARY = {
    "ExecutingaJob" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Host_Configuration_Guide-Executing_Remote_Jobs",
    "JobTemplates" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Host_Configuration_Guide-Setting_up_Job_Templates",
    "FactsandtheENC" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/",
    "Architectures" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Architectures",
    "Provisioning" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/",
    "PuppetReports" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/",
    "Realm" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/",
    "Searching" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/",
    "InstallationMedia" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Installation_Media",
    "ParameterizedClasses" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_the_Provisioning_Environment-Parameters",
    "PartitionTables" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Partition_Tables",
    "ProvisioningTemplates" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Configuring_Provisioning_Resources-Creating_Provisioning_Templates",
    "OperatingSystems" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Operating_Systems",
    "RolesandPermissions" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//server-administration-guide/#chap-Red_Hat_Satellite-Server_Administration_Guide-Users_and_Roles",
    "Parameters" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_the_Provisioning_Environment-Parameters",
    "GettingHelp" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//transition-guide/#chap-Red_Hat_Satellite-Transition_Guide-Introduction_to_Red_Hat_Satellite",
    "LDAPAuthentication" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//server-administration-guide/#sect-Red_Hat_Satellite-Server_Administration_Guide-Creating_User_Groups-Configuring_External_User_Groups",
    "VMwareNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Provisioning_Virtual_Machines_in_VMware_vSphere",
    "RackspaceNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "RHEVNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Provisioning_Virtual_Machines_in_Red_Hat_Enterprise_Virtualization",
    "OpenStackNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Provisioning_Cloud_Instances_in_Red_Hat_OpenStack_Platform",
    "LibvirtNote" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Provisioning_Virtual_Machines_in_KVM",
    "EC2" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//provisioning-guide/#Provisioning_Cloud_Instances_in_Amazon_EC2",
    "GoogleComputeEngineNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "ComputeResources" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "SmartProxies" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//installation-guide/#installing_capsule_server",
    "SmartVariables" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Smart_Variables",
    "ConfigurationOptions" => "https://access.redhat.com/documentation/en/red-hat-satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/single//host-configuration-guide/",
    "Classes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Importing_Parameterized_Classes_from_a_Puppet_Master",
    "Environments" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/host-configuration-guide/",
    "Bookmarks" => "https://access.redhat.com/documentation/en/red-hat-satellite/6.2/paged/host-configuration-guide/44-monitoring-compliance#sect-Red_Hat_Satellite-Host_Configuration_Guide-Compliance_Reports_Overview-Searching_Compliance_Reports"
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
      url = "https://access.redhat.com/documentation/en/red-hat-satellite/version-6.2/host-configuration-guide/"
    end
    url
  end
end
