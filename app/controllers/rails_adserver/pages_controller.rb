module RailsAdserver
  class PagesController < RailsAdserver::ApplicationController
    before_filter :_authenticate
    def home
      @title = "Overview"
    end
  end
end
