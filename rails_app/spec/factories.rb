require 'ffaker'

FactoryGirl.define do
  factory :user do
    fullname Faker::Name.name
    email  Faker::Internet.email
    company  Faker::Company.name
    school  Faker::Company.name
    grade  Faker::Number.number(1)
    city  Faker::Address.city
    country  Faker::Address.country
    phone  Faker::PhoneNumber.cell_phone
    about  Faker::Lorem.paragraph(2)
    linkedin  Faker::Internet.url('www.linkedin.com')
  end

  factory :event do
    title Faker::Lorem.sentence(3)
    description Faker::Lorem.paragraph(2)
    location Faker::Address.street_address
    event_date Faker::Business.credit_card_expiry_date
    slot Faker::Number.number(2)
    price Faker::Number.number(2)
  end

  factory :event_with_users, :parent => :event do
    users {[FactoryGirl.create(:user)]}
  end
end

