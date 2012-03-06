module RailsAdserver
  class Click < ActiveRecord::Base
    belongs_to :advertisement
  end
end
