# This migration comes from rails_adserver (originally 20120306023105)
class Geolocation < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :geolocation_location, :string
  end
end
