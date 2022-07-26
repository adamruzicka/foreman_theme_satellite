# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
module ForemanThemeSatellite
  module Documentation
    USER_GUIDE_DICTIONARY = {
      'using-config-groups' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-using_config_groups_to_manage_puppet_classes",
      'SmartMatchers' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Configuring_Smart_Class_Parameters",
      'ImportingRoles' => "#{ForemanThemeSatellite.documentation_root}/configuring_satellite_to_use_ansible/getting-started-with-ansible_ansible#importing-Ansible-variables_ansible",
      'Variables' => "#{ForemanThemeSatellite.documentation_root}/configuring_satellite_to_use_ansible/getting-started-with-ansible_ansible#creating-Ansible-variables_ansible",
      'ForemanRemoteExecution' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/configuring-and-setting-up-remote-jobs_managing-hosts#about-running-jobs-on-hosts_managing-hosts",
      'ExecutingaJob' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/configuring-and-setting-up-remote-jobs_managing-hosts#configuring-the-global-smartproxy-remote-execution-setting_managing-hosts",
      'JobTemplates' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/configuring-and-setting-up-remote-jobs_managing-hosts#setting-up-job-templates_managing-hosts",
      'FactsandtheENC' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-storing_and_maintaining_host_information#sect-Red_Hat_Satellite-Puppet_Guide-Storing_and_Maintaining_Host_Information-Using_Facter_and_Facts",
      'Architectures' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#configuring-provisioning-resources-Architectures",
      'Provisioning' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/",
      'PuppetReports' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-monitoring_resources#chap-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Using_the_Red_Hat_Satellite_Content_Dashboard",
      'Realm' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Configuring_External_Authentication-External_Authentication_for_Provisioned_Hosts",
      'Searching' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking",
      'InstallationMedia' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#configuring-provisioning-resources-Creating_Installation_Media",
      'ParameterizedClasses' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Importing_Parameterized_Classes_from_a_Puppet_Master",
      'PartitionTables' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#configuring-provisioning-resources-Creating_Partition_Tables",
      'ProvisioningTemplates' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#creating-provisioning-templates_provisioning",
      'OperatingSystems' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#configuring-provisioning-resources-Creating_Operating_Systems",
      'RolesandPermissions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-users_and_roles",
      'Parameters' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Parameters",
      'LDAPAuthentication' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-configuring_external_authentication",
      'VMwareNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_virtual_machines_in_vmware_vsphere",
      'RackspaceNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide",
      'RHEVNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-virtual-machines-rhv_provisioning",
      'OpenStackNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-cloud-instances-openstack",
      'LibvirtNote' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-virtual-machines-rhv_provisioning",
      'EC2' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning_cloud_instances_in_amazon_ec2",
      'GoogleComputeEngineNotes' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-cloud-instances-gce",
      'ComputeResources' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-introduction#provisioning-overview_provisioning",
      'SmartProxies' => "#{ForemanThemeSatellite.documentation_root}/planning_for_red_hat_satellite/chap-documentation-architecture_guide-capsule_server_overview",
      'SmartVariables' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Configuring_Smart_Variables",
      'ConfigurationOptions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/",
      'Trends' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-monitoring_resources#monitoring_trends",
      'Classes' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Adding_Puppet_Modules_to_Red_Hat_Satellite_6-Importing_Parameterized_Classes_from_a_Puppet_Master",
      'Environments' => "#{ForemanThemeSatellite.documentation_root}/puppet_guide/chap-red_hat_satellite-puppet_guide-adding_puppet_modules_to_red_hat_satellite_6#sect-Red_Hat_Satellite-Puppet_Guide-Puppet_Environments",
      'Bookmarks' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-searching_and_bookmarking#sect-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Searching_and_Bookmarking-Bookmarking",
      'NoVNC' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#configuring-provisioning-resources-Accessing_Virtual_Machines_with_the_noVNC_Console",
      'HTTP(S)Proxy' => "#{ForemanThemeSatellite.documentation_root}/installing_satellite_server_from_a_connected_network/performing-additional-configuration#configuring-satellite-with-an-http-proxy_satellite",
      'GettingHelp' => "https://access.redhat.com/products/red-hat-satellite/#support",
      'Policydeploymentoptions' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-red_hat_satellite-administering_red_hat_satellite-security_compliance_management#creating-a-complicance-policy_assembly",
      'Auditing' => "#{ForemanThemeSatellite.documentation_root}/planning_for_red_hat_satellite/appe-red_hat_satellite-architecture_guide-glossary_of_terms#varl-Glossary_of_Terms-Audits",
      'ReportTemplates' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/using_report_templates",
      'UsingComputeProfiles' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-provisioning-resources#creating-compute-profiles_provisioning",
      'Networking' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring_networking#Configuring_Networking-Adding_a_Subnet_to_the_Satellite_Server",
      'Reports' => "#{ForemanThemeSatellite.documentation_root}/managing_hosts/using_report_templates",
      'CreatingSCAPcontent' => "#{ForemanThemeSatellite.documentation_root}/administering_red_hat_satellite/chap-administering-security_compliance_management#sect-Administering-Security_Compliance_Management_with_OpenSCAP-Configuring_SCAP_Content",
    }.freeze

    PLUGINS_DOCUMENTATION = {
      'foreman_azure' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/provisioning-cloud-instances-azure",
      'foreman_discovery' => "#{ForemanThemeSatellite.documentation_root}/provisioning_guide/configuring-the-discovery-service",
    }.freeze

    SPECIAL_LINKS = [
      [/docs\.theforeman\.org\/.*?\/Managing_Hosts\/.*?registering-a-host.*?managing-hosts/i, "#{ForemanThemeSatellite.documentation_root}/managing_hosts/registering_hosts_to_server_managing-hosts#Registering_Hosts_managing-hosts"],
    ]
  end
end
