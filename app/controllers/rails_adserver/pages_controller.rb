module RailsAdserver
  class PagesController < RailsAdserver::ApplicationController
    before_filter :_authenticate
    def home
      @title = "Overview"
      @adspaces = RailsAdserver::Adspace.find(:all)
    end
  end
end
