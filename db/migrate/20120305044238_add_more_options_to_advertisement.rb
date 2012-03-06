class AddMoreOptionsToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :ad_text, :text
    add_column :rails_adserver_advertisements, :url, :string
    add_column :rails_adserver_advertisements, :geolocation_boolean, :boolean
  end
end
