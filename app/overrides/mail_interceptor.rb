class MailInterceptor
  def self.delivering_email(mail)
    mail.body.raw_source.gsub! "Foreman", "Satellite"
  end
end
