require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I navigate to the index page" do
    before(:each) do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @buzz = Astronaut.create(name: "Buzz Aldrin", age: 34, job: "Lunar Module Pilot")
      @apollo = Mission.create(title: "Apollo 11", time_in_space: 8)
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



  end
end
