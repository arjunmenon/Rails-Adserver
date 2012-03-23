class AddBackupBooleanToAds < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :backup, :boolean
  end
end
