# This migration comes from rails_adserver (originally 20120305044238)
class AddMoreOptionsToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :ad_text, :text
    add_column :rails_adserver_advertisements, :url, :string
    add_column :rails_adserver_advertisements, :geolocation_boolean, :boolean
  end
end
