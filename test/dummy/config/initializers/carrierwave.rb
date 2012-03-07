require 'carrierwave'
CarrierWave.configure do |config|
  config.root = "#{Dir.pwd}/public/"
end