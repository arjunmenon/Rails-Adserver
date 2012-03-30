# This migration comes from rails_adserver (originally 20120305195421)
class AddMaxClicksToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :max_clicks, :integer
    add_column :rails_adserver_advertisements, :clicks, :integer
  end
end
