# This migration comes from rails_adserver (originally 20120227014859)
class CreateRailsAdserverAdvertisements < ActiveRecord::Migration
  def change
    create_table :rails_adserver_advertisements do |t|
      t.string :title
      t.text :content
      t.integer :width
      t.integer :height
      t.boolean :is_active

      t.timestamps
    end
  end
end
