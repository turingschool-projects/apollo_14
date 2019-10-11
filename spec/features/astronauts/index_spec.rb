require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I navigate to the index page" do
    before(:each) do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @buzz = Astronaut.create(name: "Buzz Aldrin", age: 34, job: "Lunar Module Pilot")
      @apollo = Mission.create(title: "Apollo 11", time_in_space: 8)
      @gemini_8 = Mission.create(title: "Gemini 8", time_in_space: 1)
      @gemini_12 = Mission.create(title: "Gemini 12", time_in_space: 4)
    end

    it "I see a list of all astronauts' names, ages, and jobs" do

      visit '/astronauts'

      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content(@neil.name)
        expect(page).to have_content(@neil.age)
        expect(page).to have_content(@neil.job)

        expect(page).to_not have_content(@buzz.name)
      end

      within("#astronaut-#{@buzz.id}") do
        expect(page).to have_content(@buzz.name)
        expect(page).to have_content(@buzz.age)
        expect(page).to have_content(@buzz.job)

        expect(page).to_not have_content(@neil.name)
      end
    end

    it "I see an average age of all astronauts on the page" do
      visit '/astronauts'

      expect(page).to have_content("Average Age: #{Astronaut.avg_age}")
    end

    it "Has a list of all missions' titles and time in space" do
      visit '/astronauts'

      within("#mission-#{@apollo.id}") do
        expect(page).to have_content(@apollo.title)
        expect(page).to have_content(@apollo.time_in_space)
      end

      within("#mission-#{@apollo.id}") do
        expect(page).to have_content(@apollo.title)
        expect(page).to have_content(@apollo.time_in_space)
      end

      within("#mission-#{@gemini_8.id}") do
        expect(page).to have_content(@gemini_8.title)
        expect(page).to have_content(@gemini_8.time_in_space)
      end

      within("#mission-#{@gemini_12.id}") do
        expect(page).to have_content(@gemini_12.title)
        expect(page).to have_content(@gemini_12.time_in_space)
      end
    end

    it "Each astronaut box also displays their total time in space" do
      neilapollo = AstronautMission.create(astronaut_id: @neil.id, mission_id: @apollo.id)
      neilgemini = AstronautMission.create(astronaut_id: @neil.id, mission_id: @gemini_8.id)
      buzzapollo = AstronautMission.create(astronaut_id: @buzz.id, mission_id: @apollo.id)
      buzzapollo = AstronautMission.create(astronaut_id: @buzz.id, mission_id: @gemini_12.id)

      visit '/astronauts'

      within("#astronaut-#{@neil.id}") do
        expect(page).to have_content("Days in Space: 9")
      end

      within("#astronaut-#{@buzz.id}") do
        expect(page).to have_content("Days in Space: 12")
      end
    end
  end
end
