class CreateRailsAdserverClicks < ActiveRecord::Migration
  def change
    create_table :rails_adserver_clicks do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
