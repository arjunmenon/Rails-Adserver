module RailsAdserver
  class AdvertisementsController < RailsAdserver::ApplicationController
    before_filter :_authenticate, :except => [:ad]
    require 'carrierwave'
    def ad
      space = RailsAdserver::Adspace.find(params[:adspace_id])
      if params[:id] != nil
        id = space.advertisements.random_ad(params[:id])
      else
        id = nil
      end
      
      if id != nil
        @advertisement = RailsAdserver::Advertisement.find(id)  
      else 
        geo_ip = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip)
        geo =  Geokit::Geocoders::MultiGeocoder.geocode("#{geo_ip.city},#{geo_ip.state},#{geo_ip.country}")
        id =  RailsAdserver::Advertisement.geo_city(geo.city)
        if id
          @advertisement = RailsAdserver::Advertisement.find(id)
        else
          id = space.advertisements.geo_state(geo.state)
          if id
            @advertisement = RailsAdserver::Advertisement.find(id)
          else
            id = space.advertisements.geo_country(geo.country)
            if id
              @advertisement = RailsAdserver::Advertisement.find(id)
            else
              id = space.advertisements.random_ad(nil)
              unless id == nil
                @advertisement = RailsAdserver::Advertisement.find(id)
              end
            end
          end
        end
      end
      
      respond_to do |format|
        format.html {render :layout => false}
      end
    end
     
    def click
      client_ip = request.remote_ip
      ad = Advertisement.find(params[:id])
      ad.clicks.create(:ip_address => client_ip)
      ad.update_attribute(:click_count,ad.clicks.count)
      if ad.click_count >= ad.max_clicks
        unless ad.max_clicks == 0
          ad.update_attribute(:is_active,false)
        end
      end
      redirect_to ad.url
    end
    # GET /advertisements
    def index
      @advertisements = Advertisement.all
      @title = "Advertisements"
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @advertisements }
      end
    end
  
    # GET /advertisements/1
    def show
      @advertisement = Advertisement.find(params[:id])
      @title = @advertisement.title
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @advertisement }
      end
    end
  
    # GET /advertisements/new
    def new
      @advertisement = Advertisement.new
      @title = "New Advertisement"
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @advertisement }
      end
    end
  
    # GET /advertisements/1/edit
    def edit
      @advertisement = Advertisement.find(params[:id])
    end
  
    # POST /advertisements
    def create
      @advertisement = Advertisement.new(params[:advertisement])
      geo = Geokit::Geocoders::MultiGeocoder.geocode(@advertisement.geolocation_location)
      @advertisement.update_attributes(:city_name => geo.city, :state_name => geo.state, :country_name => geo.country)
      respond_to do |format|
        if @advertisement.save
          format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
          format.json { render json: @advertisement, status: :created, location: @advertisement }
        else
          format.html { render action: "new" }
          format.json { render json: @advertisement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /advertisements/1
    def update
      @advertisement = Advertisement.find(params[:id])
      respond_to do |format|
        if @advertisement.update_attributes(params[:advertisement])
          geo = Geokit::Geocoders::MultiGeocoder.geocode(@advertisement.geolocation_location)
          @advertisement.update_attributes(:city_name => geo.city, :state_name => geo.state, :country_name => geo.country)
          format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @advertisement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /advertisements/1
    def destroy
      @advertisement = Advertisement.find(params[:id])
      @advertisement.destroy
  
      respond_to do |format|
        format.html { redirect_to advertisements_url }
        format.json { head :no_content }
      end
    end
    
  end
end
