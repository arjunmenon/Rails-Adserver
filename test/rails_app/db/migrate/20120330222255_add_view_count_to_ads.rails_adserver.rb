# This migration comes from rails_adserver (originally 20120328043354)
class AddViewCountToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :max_impressions, :integer

  end
end
