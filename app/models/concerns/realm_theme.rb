module RealmTheme
  extend ActiveSupport::Concern
  included do
    remove_const(:TYPES)
    const_set(:TYPES, ["Red Hat Identity Management", "Active Directory"])
  end
end
