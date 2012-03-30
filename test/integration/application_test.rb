require "minitest_helper"

describe "Application integration" do
  before do
    User.destroy_all
    @user = FactoryGirl.create(:user)
    @nonvalid_user = FactoryGirl.create(:user, :can_manage_ads => false)
  end
  it "allows a valid signed in user to go to adserver root" do
    login_as(@user, :scope => :user)
    visit '/rails_adserver/'
    page.text.must_include "Adserver"
    # The text adserver exists in the footer.
  end
  it "does not allow a non-valid signed in user to go to adserver root" do
    login_as(@nonvalid_user, :scope => :user)
    visit '/rails_adserver/'
    page.text.must_include "404"
  end
end