module RailsAdserver
  class PagesController < ApplicationController
    helper_method :_current_user
    before_filter :authenticate
    def home
      @title = "Overview"
    end
  end
end
