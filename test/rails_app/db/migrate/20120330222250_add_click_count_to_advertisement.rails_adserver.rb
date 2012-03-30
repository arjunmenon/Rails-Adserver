# This migration comes from rails_adserver (originally 20120305214753)
class AddClickCountToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :click_count, :integer
    remove_column :rails_adserver_advertisements, :clicks
  end
end
