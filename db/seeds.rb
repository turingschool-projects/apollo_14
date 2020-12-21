# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

astro1 = Astronaut.create!(name: "Bob", age: 34, job: "Commander")
astro2 = Astronaut.create!(name: "Jill", age: 34, job: "Private")
astro3 = Astronaut.create!(name: "Joe", age: 34, job: "Colonel")
astro4 = Astronaut.create!(name: "Has", age: 34, job: "Lieutenant")

mission1 = Mission.create!(title: "Mission to Mars", time_in_space: 20)
mission2 = Mission.create!(title: "Mission to Moon", time_in_space: 1)
mission3 = Mission.create!(title: "Mission to Sun", time_in_space: 80)

AstronautMission.create!(astronaut: astro1, mission: mission1)
AstronautMission.create!(astronaut: astro1, mission: mission2)
AstronautMission.create!(astronaut: astro2, mission: mission3)
AstronautMission.create!(astronaut: astro3, mission: mission3)