require "minitest_helper"

describe "Advertisements integration" do
  before do
    User.destroy_all
    RailsAdserver::Adspace.destroy_all
    RailsAdserver::Advertisement.destroy_all
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
    RailsAdserver::Advertisement.find(:last).destroy
  end
  it "should not display a non active ad" do
    login_as(@user, :scope => :user)
    visit '/rails_adserver/'
    click_link "New Advertisement"
    fill_in 'advertisement_title', :with => "Foo Bar"
    select(@adspace.name, :from => 'advertisement_adspace_id')
    choose('advertisement_ad_type_ad_service')
    fill_in 'advertisement_ad_text', :with => "Text"
    click_button "Submit"
    visit "/rails_adserver/ad/space/#{@adspace.id}"
    page.text.wont_include "Text"
    RailsAdserver::Advertisement.find(:last).destroy
  end
  it "should display an active ad" do
    login_as(@user, :scope => :user)
    visit '/rails_adserver/'
    click_link "New Advertisement"
    fill_in 'advertisement_title', :with => "Foo Bar"
    select(@adspace.name, :from => 'advertisement_adspace_id')
    choose('advertisement_ad_type_ad_service')
    fill_in 'advertisement_ad_text', :with => "Text"
    check('advertisement_is_active')
    click_button "Submit"
    visit "/rails_adserver/ad/space/#{@adspace.id}"
    page.text.must_include "Text"
    RailsAdserver::Advertisement.find(:last).destroy
  end
end