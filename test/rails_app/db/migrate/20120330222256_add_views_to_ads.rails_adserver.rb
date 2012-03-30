# This migration comes from rails_adserver (originally 20120328043651)
class AddViewsToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :impressions_count, :integer

  end
end
