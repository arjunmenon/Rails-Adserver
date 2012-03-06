require "rails_adserver/engine"
require "rails_adserver/config"
module RailsAdserver
  def self.config(entity = nil, &block)
    if entity
      RailsAdserver::Config.model(entity, &block)
    elsif block_given? && ENV['SKIP_RAILS_ADMIN_INITIALIZER'] != "true"
      block.call(RailsAdserver::Config)
    else
      RailsAdserver::Config
    end
  end
end
