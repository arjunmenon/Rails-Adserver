class Geolocation < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :geolocation_location, :string
  end
end
