require "minitest_helper"

describe "Adspace integration" do
  before do
    User.destroy_all
    RailsAdserver::Adspace.destroy_all
    RailsAdserver::Advertisement.destroy_all
    @user = FactoryGirl.create(:user)
  end
  it "Creates an Adspace" do
    login_as(@user, :scope => :user)
    visit '/rails_adserver/'
    click_link 'Ad-Spaces'
    click_link "New Adspace"
    fill_in 'adspace_name', :with => "Foo Bar"
    click_button "Submit"
    page.text.must_include "Foo Bar"
  end
end