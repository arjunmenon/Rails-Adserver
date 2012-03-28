class AddViewCountToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :max_impressions, :integer

  end
end
