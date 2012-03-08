module RailsAdserver
  class PagesController < ApplicationController
    before_filter :authenticate
    helper_method :_current_user
    def home
      @title = "Overview"
    end
    
    private
    def authenticate
      unless _current_user.can_manage_ads
        redirect_to '/500.html'
      end
    end
    
  end
end
