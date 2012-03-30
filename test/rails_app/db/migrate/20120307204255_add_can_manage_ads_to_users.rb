class AddCanManageAdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :can_manage_ads, :boolean

  end
end
