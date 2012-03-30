# This migration comes from rails_adserver (originally 20120228010315)
class AddNameToAdspace < ActiveRecord::Migration
  def change
    add_column :rails_adserver_adspaces, :name, :string
  end
end
