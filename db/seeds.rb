# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

7.times do
  FactoryBot.create :astronaut_mission
end

astronaut1 = create(:astronaut)
astronaut.missions = create_list(:mission, 3)


# 5.times do
#   FactoryBot.create :astronaut
# end

# 5.times do
#   FactoryBot.create :mission
# end
