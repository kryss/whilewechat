require 'faker'

FactoryGirl.define do

  factory :event do
    title  { Faker::Lorem.sentence(3) }
    description  { Faker::Lorem.paragraph(2) }
    location  { Faker::Address.street_address }
    event_date DateTime.now
    slot  { Faker::Number.number(2) }
    price  { Faker::Number.number(2) }
  end

end

