module RailsAdserver
  class Adspace < ActiveRecord::Base
    has_many :advertisements
  end
end
