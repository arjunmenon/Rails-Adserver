FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password "foobar"
    can_manage_ads true
  end
end