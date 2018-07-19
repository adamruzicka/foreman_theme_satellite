CommonParameter.without_auditing do
  CommonParameter.skip_permission_check do
    param = CommonParameter.find_by_name('enable-epel')
    if param.nil?
      CommonParameter.create!(:name => 'enable-epel', :value => 'false')
    end
  end
end
