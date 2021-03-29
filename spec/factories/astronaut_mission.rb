require 'faker'

FactoryBot.define do
  factory :astronaut_mission do
    astronaut
    mission
  end
end
