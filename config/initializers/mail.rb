ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['GOOGLE_MAIL_USER'],
  :password       => ENV['GOOGLE_MAIL_PASSWORD']
}
ActionMailer::Base.delivery_method = :smtp