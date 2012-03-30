# This migration comes from rails_adserver (originally 20120305054319)
class AddImageToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :image, :string
  end
end
