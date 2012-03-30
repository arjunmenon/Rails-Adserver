# This migration comes from rails_adserver (originally 20120323174313)
class AddBackupBooleanToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :backup, :boolean
  end
end
