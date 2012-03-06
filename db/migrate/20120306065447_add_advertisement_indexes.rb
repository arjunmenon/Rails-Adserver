class AddAdvertisementIndexes < ActiveRecord::Migration
  def change
      add_index :rails_adserver_advertisements, :param_restriction
      add_index :rails_adserver_advertisements, :city_name
      add_index :rails_adserver_advertisements, :state_name
      add_index :rails_adserver_advertisements, :country_name
  end
end
