# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

      neil = Astronaut.create!(name: "Neil", age: 1, job: "pilot")
      sally = Astronaut.create!(name: "Sally", age: 2, job: "commander")
      buzz = Astronaut.create!(name: "Buzz", age: 3, job: "co-pilot")

      mission_1 = Mission.create!(title: "Gemini", time_in_space: 1)
      mission_2 = Mission.create!(title: "Apollo", time_in_space: 2)
      mission_3 = Mission.create!(title: "Capricorn", time_in_space: 4)

      astro_mission_1 = AstronautMission.create!(astronaut_id: neil.id, mission_id: mission_1.id)
      astro_mission_2 = AstronautMission.create!(astronaut_id: sally.id, mission_id: mission_1.id)
      astro_mission_3 = AstronautMission.create!(astronaut_id: buzz.id, mission_id: mission_2.id)
      astro_mission_4 = AstronautMission.create!(astronaut_id: neil.id, mission_id: mission_2.id)
      astro_mission_5 = AstronautMission.create!(astronaut_id: neil.id, mission_id: mission_3.id)
      astro_mission_6 = AstronautMission.create!(astronaut_id: sally.id, mission_id: mission_3.id)
