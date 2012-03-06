class AddImageToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :image, :string
  end
end
