# This migration comes from rails_adserver (originally 20120305040026)
class AddParameterRestrictionBooleanToAdvertisement < ActiveRecord::Migration
  def change
    add_column :rails_adserver_advertisements, :parameter_restriction_boolean, :boolean

  end
end
