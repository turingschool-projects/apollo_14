# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

# 7.times do
#   FactoryBot.create :astronaut_mission
# end

# 5.times do
#   FactoryBot.create :astronaut

# end

# 5.times do
#   FactoryBot.create :mission
# end


# 5.times do 
#   FactoryBot.create_list(:astronaut_mission, 7)
# end

# astronaut = FactoryBot.create(:astronaut)

# astronaut_list = FactoryBot.create_list(:astronaut, 5)
# astro1 = astronaut_list.first
# astro2 = astronaut_list.second
# astro3 = astronaut_list.third
# astro4 = astronaut_list.fourth
# astro5 = astronaut_list.fifth

# astro1 = FactoryBot.create(:astronaut)
# astro2 = FactoryBot.create(:astronaut)
# astro3 = FactoryBot.create(:astronaut)
# astro4 = FactoryBot.create(:astronaut)
# astro5 = FactoryBot.create(:astronaut)

# mission1 = Mission.create(title: "Zulu", time_in_space: 444)
# mission2 = Mission.create(title: "Moon", time_in_space: 8854)
# mission3 = Mission.create(title: "Sagittarius A", time_in_space: 9965)

# AstronautMission.create(astronaut_id: astro1.id, mission_id: mission1.id)
# AstronautMission.create(astronaut_id: astro1.id, mission_id: mission2.id)
# AstronautMission.create(astronaut_id: astro1.id, mission_id: mission3.id)
# AstronautMission.create(astronaut_id: astro2.id, mission_id: mission1.id)
# AstronautMission.create(astronaut_id: astro2.id, mission_id: mission2.id)
# AstronautMission.create(astronaut_id: astro2.id, mission_id: mission3.id)
# AstronautMission.create(astronaut_id: astro3.id, mission_id: mission1.id)


5.times do
  AstronautMission.create(astronaut: FactoryBot.create(:astronaut), mission: FactoryBot.create(:mission))
end