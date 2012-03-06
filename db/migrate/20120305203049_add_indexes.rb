class AddIndexes < ActiveRecord::Migration
  def change
    add_column :rails_adserver_clicks, :rails_adserver_advertisement_id, :integer
    add_index :rails_adserver_clicks, :rails_adserver_advertisement_id
    add_column :rails_adserver_advertisements, :rails_adserver_adspace_id, :integer
    add_index :rails_adserver_advertisements, :rails_adserver_adspace_id
  end
end
