if Rails.env.production?
  # usar serviço mtp para envio de emails
  ActionMailer::Base.delivery_method = :smtp
  # manda os emails de fato
  ActionMailer::Base.perform_deliveries = true

  ActionMailer::Base.smtp_settings = {
    user_name: Rails.appplication.credentials.mail_user_name,
    password: Rails.appplication.credentials.mail_secret_name,
    domain: 'yourdomain.com',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto:  true
  }

  ActionMailer::Base.default_url_options = { host: 'yourdomain.com' }
end