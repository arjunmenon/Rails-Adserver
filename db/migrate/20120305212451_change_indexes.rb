class ChangeIndexes < ActiveRecord::Migration
  def change
    remove_index :rails_adserver_clicks, :rails_adserver_advertisement_id
    remove_index :rails_adserver_advertisements, :rails_adserver_adspace_id
    remove_column :rails_adserver_clicks, :rails_adserver_advertisement_id
    remove_column :rails_adserver_advertisements, :rails_adserver_adspace_id
    
    add_column :rails_adserver_clicks, :advertisement_id, :integer
    add_index :rails_adserver_clicks, :advertisement_id
  end
end
