class AddViewsToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :impressions_count, :integer

  end
end
