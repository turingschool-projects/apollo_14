require 'faker'

FactoryBot.define do
  factory :mission do
    title { Faker::Space.nebula }
    time_in_space { Faker::Number.number(digits: 4)}
  end
end