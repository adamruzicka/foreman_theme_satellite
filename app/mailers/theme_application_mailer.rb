module ThemeApplicationMailer
  extend ActiveSupport::Concern
  included do
    #does some errors need to check
    # default :from => Setting[:email_reply_address] || "noreply@satellite.example.org"
  end
end