class CreateRailsAdserverAdspaces < ActiveRecord::Migration
  def change
    create_table :rails_adserver_adspaces do |t|

      t.timestamps
    end
  end
end
