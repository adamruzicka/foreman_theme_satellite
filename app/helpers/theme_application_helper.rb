# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# Overrides for functions used in helpers.
module ThemeApplicationHelper

  USER_GUIDE_DICTIONARY = {
    'using-config-groups' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-using_config_groups_to_manage_puppet_classes",
    'SmartMatchers' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Configuring_Smart_Class_Parameters",
    'ImportingRoles' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-managing_ansible_roles",
    'ForemanRemoteExecution' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Executing_Remote_Jobs",
    'ExecutingaJob' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Executing_Remote_Jobs",
    'JobTemplates' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/chap-managing_hosts-running_remote_jobs_on_hosts#sect-Managing_Hosts-Setting_up_Job_Templates",
    'FactsandtheENC' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-storing_and_maintaining_host_information#sect-Red_Hat_Satellite-Puppet_Guide-Storing_and_Maintaining_Host_Information-Using_Facter_and_Facts",
    'Architectures' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Architectures",
    'Provisioning' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/",
    'PuppetReports' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-monitoring_resources#chap-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Using_the_Red_Hat_Satellite_Content_Dashboard",
    'Realm' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Configuring_External_Authentication-External_Authentication_for_Provisioned_Hosts",
    'Searching' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking",
    'InstallationMedia' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Installation_Media",
    'ParameterizedClasses' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Importing_Parameterized_Classes_from_a_Puppet_Master",
    'PartitionTables' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Partition_Tables",
    'ProvisioningTemplates' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Provisioning_Templates",
    'OperatingSystems' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Creating_Operating_Systems",
    'RolesandPermissions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-users_and_roles",
    'Parameters' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Parameters",
    'LDAPAuthentication' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication",
    'VMwareNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_virtual_machines_in_vmware_vsphere",
    'RackspaceNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide",
    'RHEVNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_virtual_machines_in_red_hat_virtualization",
    'OpenStackNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_cloud_instances_in_red_hat_openstack_platform",
    'LibvirtNote' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_virtual_machines_in_kvm",
    'EC2' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_cloud_instances_in_amazon_ec2",
    'GoogleComputeEngineNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide",
    'ComputeResources' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/introduction#Introduction-Defining_Provisioning_Types",
    'SmartProxies' => "#{ForemanThemeSatellite.documentation_root}/installing_capsule_server",
    'SmartVariables' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Configuring_Smart_Variables",
    'ConfigurationOptions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/",
    'Trends' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-monitoring_resources#monitoring_trends",
    'Classes' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Importing_Parameterized_Classes_from_a_Puppet_Master",
    'Environments' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Puppet_Environments",
    'Bookmarks' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Searching_and_Bookmarking-Bookmarking",
    'NoVNC' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_provisioning_resources#Configuring_Provisioning_Resources-Accessing_Virtual_Machines_with_the_noVNC_Console",
    'HTTP(S)Proxy' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_cloud_instances_in_amazon_ec2#Provisioning_Cloud_Instances_in_Amazon_EC2-Using-an-HTTP-Smart-Proxy",
    'GettingHelp' => "https://access.redhat.com/products/red-hat-satellite/#support",
    'Policydeploymentoptions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-security_compliance_management#creating-a-complicance-policy_assembly"
  }.freeze

  def association_text()
    content_tag(:p, _('When editing a Template, you must assign a list of Operating Systems with which this Template can be used. Optionally, you can restrict a template to a list of Hostgroups or Environments.')) +
      content_tag(:p, _('When a Host requests a template (e.g. during provisioning), Foreman selects the optimal match from the available templates of that type, in the following order:')) +
      (content_tag :ul do
        content_tag(:li, _('Host group and Environment'))
        content_tag(:li, _('Host group only'))
        content_tag(:li, _('Environment only'))
        content_tag(:li, _('Operating system default'))
      end)
    (_('The final entry, Operating System default, can be set by editing the %s page.') % (link_to _('Operating System'), operatingsystems_path)).html_safe
  end

  def documentation_url(section = nil, _ = {})
    url = ''
    # this version string can be changed if needed.
    unless section.nil?
      USER_GUIDE_DICTIONARY.each do |key, val|
        url = val if section.include? key
      end
    end
    if url.empty?
      url = "#{ForemanThemeSatellite.documentation_root}/managing_hosts"
    end
    url
  end
end
