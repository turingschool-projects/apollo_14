require 'faker'

FactoryBot.define do
  factory :astronaut do
    name { Faker::Name.name }
    age { Faker::Number.number(digits: 2) }
    job { Faker::Space.agency }
  end
end
