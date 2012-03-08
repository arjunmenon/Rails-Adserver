RailsAdserver.config do |config|
  config.current_user_method { current_user }
  config.application_name = "Dummy"
  config.carrierwave_method = "File"
end