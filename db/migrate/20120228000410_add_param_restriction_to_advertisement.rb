class AddParamRestrictionToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :param_restriction, :string
  end
end
