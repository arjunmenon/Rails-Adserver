# This migration comes from rails_adserver (originally 20120228010151)
class CreateRailsAdserverAdspaces < ActiveRecord::Migration
  def change
    create_table :rails_adserver_adspaces do |t|

      t.timestamps
    end
  end
end
