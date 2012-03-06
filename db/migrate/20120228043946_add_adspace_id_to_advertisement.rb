class AddAdspaceIdToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :adspace_id, :integer
    add_index :rails_adserver_advertisements, :adspace_id
  end
end
