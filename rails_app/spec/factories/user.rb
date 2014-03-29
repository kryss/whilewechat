require 'faker'

FactoryGirl.define do
  factory :user do
    fullname { Faker::Name.name }
    email  { Faker::Internet.email }
    company  { Faker::Company.name }
    school  { Faker::Company.name }
    grade  { Faker::Number.number(1) }
    city  { Faker::Address.city }
    country  { Faker::Address.country }
    phone  { Faker::PhoneNumber.cell_phone }
    about  { Faker::Lorem.paragraph(2) }
    linkedin  { Faker::Internet.url('www.linkedin.com') }
  end
end

