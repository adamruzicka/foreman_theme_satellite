class UpdateIdmParams < ActiveRecord::Migration[5.1]
  def up
    LookupKey.unscoped.where("key like 'idm_%'").each do |key|
      key.key.gsub!('idm_', 'freeipa_')
      key.without_auditing do
        key.save!(:validate => false)
      end
    end

    Parameter.unscoped.where("name like 'idm_%'").each do |param|
      param.name.gsub!('idm_', 'freeipa_')
      param.without_auditing do
        param.save!(:validate => false)
      end
    end
  end

  def down
    LookupKey.unscoped.where("key like 'freeipa_%'").each do |key|
      key.key.gsub!('freeipa_', 'idm_')
      key.without_auditing do
        key.save!(:validate => false)
      end
    end

    Parameter.unscoped.where("name like 'freeipa_%'").each do |param|
      param.name.gsub!('freeipa_', 'idm_')
      param.without_auditing do
        param.save!(:validate => false)
      end
    end
  end
end
