class AddGeolocationNamesToAdvertisements < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :city_name, :string
    add_column :rails_adserver_advertisements, :state_name, :string
    add_column :rails_adserver_advertisements, :country_name, :string
  end
end
