class AddNameToAdspace < ActiveRecord::Migration
  def change
    add_column :rails_adserver_adspaces, :name, :string
  end
end
