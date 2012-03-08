require 'active_support/core_ext/class/attribute_accessors'
module RailsAdserver
  module Config
    class << self
      attr_accessor :application_name
      attr_accessor :carrierwave_method
      def current_user_method(&block)
        @current_user = block if block
        @current_user || DEFAULT_CURRENT_USER
      end
    end
  end
end