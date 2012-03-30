require "minitest_helper"

describe "Advertisements integration" do
  before do
    User.destroy_all
    RailsAdserver::Adspace.destroy_all
    @adspace = RailsAdserver::Adspace.create(:name => 'foo bar')
    @user = FactoryGirl.create(:user)
  end
  it "Creates an Adevertisement" do
    login_as(@user, :scope => :user)
    visit '/rails_adserver/'
    click_link 'New Advertisement'
    fill_in 'advertisement_title', :with => "Foo Bar"
    select(@adspace.name, :from => 'advertisement_adspace_id')
    click_button "Submit"
    page.text.must_include "Foo Bar"
  end
end