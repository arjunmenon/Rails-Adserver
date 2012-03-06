class AddParameterRestrictionBooleanToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :parameter_restriction_boolean, :boolean

  end
end
