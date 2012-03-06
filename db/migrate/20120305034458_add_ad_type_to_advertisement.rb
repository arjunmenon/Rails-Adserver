class AddAdTypeToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :ad_type, :string

  end
end
