# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.sendgrind_api_user,
  :password => Rails.application.secrets.sendgrind_api_pass,
  :domain => 'em4543.cafeshares.com',
  :address => 'smtp.sendgrind.net',
  :port => '587',
  :authentication => :plain,
  :enable_starttls_auto => true
}
