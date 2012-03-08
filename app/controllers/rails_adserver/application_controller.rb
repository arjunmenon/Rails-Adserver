module RailsAdserver
  class ApplicationController < ActionController
    helper_method :_current_user
    helper_method :_application_name
    helper_method :_model_pool
    private
    def _model_pool
      RailsAdserver::Config.models_pool
    end
    def _application_name
      RailsAdserver::Config.application_name
    end
    def _current_user
      instance_eval &RailsAdserver::Config.current_user_method
    end
    def authenticate
      unless _current_user.can_manage_ads
        redirect_to '/500.html'
      end
    end
  end
end
