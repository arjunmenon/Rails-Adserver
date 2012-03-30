# This migration comes from rails_adserver (originally 20120305034458)
class AddAdTypeToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :ad_type, :string

  end
end
