module RailsAdserver
  class Advertisement < ActiveRecord::Base
    belongs_to :adspace
    has_many :clicks
    require 'carrierwave/orm/activerecord'
    
    attr_accessible :image, :title, :content, :width, :height, :is_active, :param_restriction, :ad_text, :parameter_restriction_boolean,
    :param_restriction_name, :adspace_id, :ad_type, :url, :geolocation_boolean, :max_clicks, :geolocation_location, :city_name, :state_name, :country_name, :backup,
    :max_impressions
    
    validates :title, :presence => true
    validates :adspace_id, :presence => true
    
    mount_uploader :image, AdvertisementUploader
    
    def self.ad_with_parameter(adspace_id,param,ip)
      space = RailsAdserver::Adspace.find(adspace_id)
      id = space.advertisements.random_ad(param)
      if id == nil
        geo_ip = Geokit::Geocoders::MultiGeocoder.geocode(ip)
        geo =  Geokit::Geocoders::MultiGeocoder.geocode("#{geo_ip.city},#{geo_ip.state},#{geo_ip.country}")
        id =  space.advertisements.geo_city(geo.city)
        if id == nil
          id = space.advertisements.geo_state(geo.state)
          if id == nil
            id = space.advertisements.geo_country(geo.country)
            if id == nil
              id = space.advertisements.random_ad(nil)
              if id == nil
                id = space.advertisements.backup_ad
              end
            end
          end
        end
      end
      unless id == nil
        advertisement = RailsAdserver::Advertisement.find(id)
        if advertisement.impressions_count == nil
          advertisement.update_attribute(:impressions_count,0)
        end
        count = advertisement.impressions_count+1
        advertisement.update_attribute(:impressions_count,count)
        unless advertisement.max_impressions == 0 || advertisement.max_impressions == nil
          if advertisement.max_impressions <= advertisement.impressions_count
            advertisement.update_attribute(:is_active,false)
          end
        end
      end
      return id
    end
    
    def self.ad(adspace_id,ip)
      space = RailsAdserver::Adspace.find(adspace_id)
      geo_ip = Geokit::Geocoders::MultiGeocoder.geocode(ip)
      geo =  Geokit::Geocoders::MultiGeocoder.geocode("#{geo_ip.city},#{geo_ip.state},#{geo_ip.country}")
      id =  space.advertisements.geo_city(geo.city)
      if id == nil
        id = space.advertisements.geo_state(geo.state)
        if id == nil
          id = space.advertisements.geo_country(geo.country)
          if id == nil
            id = space.advertisements.random_ad(nil)
            if id == nil
              id = space.advertisements.backup_ad
            end
          end
        end
      end
      unless id == nil
        advertisement = RailsAdserver::Advertisement.find(id)
        if advertisement.impressions_count == nil
          advertisement.update_attribute(:impressions_count,0)
        end
        count = advertisement.impressions_count+1
        advertisement.update_attribute(:impressions_count,count)
        unless advertisement.max_impressions == 0 || advertisement.max_impressions == nil
          if advertisement.max_impressions <= advertisement.impressions_count
            advertisement.update_attribute(:is_active,false)
          end
        end
      end
      return id
    end
    
    def self.random_ad(param)
      if param == nil
        ad_ids = self.where("is_active = ? AND parameter_restriction_boolean = ? AND geolocation_boolean = ? AND backup = ?", true, false, false, false).map(&:id)
      else
        ad_ids = self.where("is_active = ? AND param_restriction = ? AND backup = ?",true, param, false).map(&:id)
      end
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_city(city)
      ad_ids = self.where("city_name = ? AND is_active = ?", city, true).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_state(state)
      ad_ids = self.where("state_name = ? AND city_name = ? AND is_active = ?", state, nil,  true).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.geo_country(country)
      ad_ids = self.where("country_name = ? AND state_name = ? AND city_name = ? AND is_active = ?", country, nil, nil, true).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
    def self.backup_ad
      ad_ids = self.where("backup = ?", true).map(&:id)
      id = ad_ids[rand(ad_ids.length)]
    end
  end
end
