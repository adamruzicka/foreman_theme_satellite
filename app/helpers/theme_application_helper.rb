module ThemeApplicationHelper

  # missing: Auditing, Bookmarks, ComputeProfile, FactsandtheENC, SmartMatchers, SmartVariables, Reports, Trends, EmailPreferences
  USER_GUIDE_DICTIONARY = {
    "InstallationMedia" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Installation_Media.html",
    "ParameterizedClasses" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/Configuring_Parameterized_Classes.html",
    "PartitionTables" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Partition_Tables.html",
    "ProvisioningTemplates" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Provisioning_Templates.html",
    "OperatingSystems" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Operating_Systems.html",
    "RolesandPermissions" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Roles.html",
    "Parameters" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Parameters.html",
    "GettingHelp" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/Transition_Guide/pref-Red_Hat_Satellite-Transition_Guide-Preface.html",
    "LDAPAuthentication" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/chap-Users_and_Roles.html",
    "VMwareNotes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "RackspaceNotes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "RHEVNotes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "OpenStackNotes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "LibvirtNote" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "EC2" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "GoogleComputeEngineNotes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "ComputeResouces" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/sect-Compute_Resources.html",
    "SmartProxies" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/chap-Red_Hat_Satellite_Capsule_Servers.html",
    "ConfigurationOptions" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/Red_Hat_Satellite_6_Workflow.html",
    "Classes" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/User_Guide/Importing_Parameterized_Classes_from_a_Puppet_Master.html",
    "Environments" => "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/#{ForemanThemeSatellite::SATELLITE_SHORT_VERSION}/html/API_Guide/chap-Environments.html"

  }

  def association_text()
    content_tag(:p, _("When editing a Template, you must assign a list of Operating Systems which this Template can be used with. Optionally, you can restrict a template to a list of Hostgroups and/or Environments")) +
      content_tag(:p, _("When a Host requests a template (e.g. during provisioning), Foreman will select the best match from the available templates of that type, in the following order:")) +
      (content_tag :ul do
        content_tag(:li, _("Host group and Environment"))
        content_tag(:li, _("Host group only"))
        content_tag(:li, _("Environment only"))
        content_tag(:li, _("Operating system default"))
      end)
    (_("The final entry, Operating System default, can be set by editing the %s page.") % (link_to _("Operating System"), operatingsystems_path)).html_safe
  end

  def documentation_url(section = nil)
    url = ""
    # this version string can be changed if needed.
    unless section.nil?
      USER_GUIDE_DICTIONARY.each do |key,val|
        url = val if section.include? key
      end
    end
    unless url
      url = "https://access.redhat.com/documentation/en-US/Red_Hat_Satellite/6.0/html/User_Guide/index.html"
    end
    url
  end
end
