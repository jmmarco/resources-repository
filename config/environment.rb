# Load the Rails application.
require_relative 'application'

if Rails.env == 'development' || Rails.env == 'text'
  Hirb.enable
end

# Initialize the Rails application.
Rails.application.initialize!
