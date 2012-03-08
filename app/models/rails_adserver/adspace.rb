module RailsAdserver
  class Adspace < ActiveRecord::Base
    has_many :advertisements
    validates :name, :presence => true
  end
end
