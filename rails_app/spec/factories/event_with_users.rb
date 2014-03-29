require 'faker'

FactoryGirl.define do


  factory :event_with_users, :parent => :event do
    users {[FactoryGirl.create(:user)]}
  end
end

