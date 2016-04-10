module ThemeApplicationHelper

  USER_GUIDE_DICTIONARY = {
    "FactsandtheENC" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "Architectures" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "Provisioning" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "PuppetReports" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "Realm" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "Searching" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "InstallationMedia" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Installation_Media",
    "ParameterizedClasses" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_the_Provisioning_Environment-Parameters",
    "PartitionTables" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Partition_Tables",
    "ProvisioningTemplates" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Provisioning_Templates",
    "OperatingSystems" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Operating_Systems",
    "RolesandPermissions" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/server-administration-guide/#chap-Red_Hat_Satellite-Server_Administration_Guide-Users_and_Roles",
    "Parameters" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_the_Provisioning_Environment-Parameters",
    "GettingHelp" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/transition-guide/#chap-Red_Hat_Satellite-Transition_Guide-Introduction_to_Red_Hat_Satellite",
    "LDAPAuthentication" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/server-administration-guide/#sect-Red_Hat_Satellite-Server_Administration_Guide-Creating_User_Groups-Configuring_External_User_Groups",
    "VMwareNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "RackspaceNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "RHEVNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "OpenStackNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "LibvirtNote" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "EC2" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "GoogleComputeEngineNotes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "ComputeResources" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Provisioning_Settings-Compute_Resources",
    "SmartProxies" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/installation-guide/#chap-Red_Hat_Satellite-Installation_Guide-Installing_Capsule_Server",
    "SmartVariables" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_Smart_Parameters",
    "ConfigurationOptions" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/",
    "Classes" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#sect-Red_Hat_Satellite-Host_Configuration_Guide-Importing_Parameterized_Classes_from_a_Puppet_Master",
    "Environments" => "https://access.redhat.com/documentation/en/red-hat-satellite/version-#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}-beta/host-configuration-guide/#chap-Red_Hat_Satellite-Host_Configuration_Guide-Configuring_the_Provisioning_Environment"
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
      url = "https://access.redhat.com/documentation/en/red-hat-satellite/version-6.2-beta/host-configuration-guide/"
    end
    url
  end
end
