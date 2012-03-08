= RailsAdserver

'''ruby
rails new Adserver_App
gem 'rails_adserver'
rake rails_adserver:install:migrations
mount RailsAdserver::Engine => "/rails_adserver"
'''

Initializer File:
You need to give rails_adserver access to the user model and name of the application.
'''ruby
RailsAdserver.config do |config|
  config.current_user_method { current_user }
  config.application_name = "App Name"
end
'''

add a migration to the user
'''ruby
rails g migration add_management_of_ads_to_users can_manage_ads:boolean
'''

Carrierwave Initializer File Without Fog
'''ruby
require 'carrierwave'
CarrierWave.configure do |config|
  config.root = "#{Dir.pwd}/public/"
end
'''

Carrierwave Initializer File With Fog
'''ruby
require 'carrierwave'
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'Access Key Id',
    :aws_secret_access_key  => 'Access Key'
  }
  config.fog_directory  = 'bucket name'
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  config.storage = :fog
  config.permissions = 0777
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
end
'''