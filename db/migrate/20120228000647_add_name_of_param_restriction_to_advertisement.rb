class AddNameOfParamRestrictionToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :param_restriction_name, :string
  end
end
