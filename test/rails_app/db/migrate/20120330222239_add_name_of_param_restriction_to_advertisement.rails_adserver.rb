# This migration comes from rails_adserver (originally 20120228000647)
class AddNameOfParamRestrictionToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :param_restriction_name, :string
  end
end
