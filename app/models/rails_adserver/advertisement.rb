module RailsAdserver
  class Advertisement < ActiveRecord::Base
    belongs_to :adspace
    has_many :clicks
    require 'carrierwave/orm/activerecord'
    
    attr_accessible :image, :title, :content, :width, :height, :is_active, :param_restriction, :ad_text, :parameter_restriction_boolean,
    :param_restriction_name, :adspace_id, :ad_type, :url, :geolocation_boolean, :max_clicks, :geolocation_location, :city_name, :state_name, :country_name
    
    mount_uploader :image, AdvertisementUploader
    def self.random_ad(adspace,param)
      if param == nil
        ad_ids = RailsAdserver::Advertisement.where("is_active = ? AND parameter_restriction_boolean = ? AND adspace_id = ?", true, false,adspace).map(&:id)
      else
        ad_ids = RailsAdserver::Advertisement.where("is_active = ? AND param_restriction = ? AND adspace_id = ?",true, param,adspace).map(&:id)
      end
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_city(adspace, city)
      ad_ids = where("city_name = ? AND is_active = ? AND adspace_id = ?", city, true, adspace).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_state(adspace, state)
      ad_ids =where("state_name = ? AND is_active = ? AND adspace_id = ?", state, true, adspace).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_country(adspace, country)
      ad_ids =where("country_name = ? AND is_active = ? AND adspace_id = ?", country, true, adspace).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
  end
end
