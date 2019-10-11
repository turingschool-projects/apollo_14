require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit an astronaut page' do
    it 'then I see a list of astronauts' do
      astronaut = Astronaut.create(name: "Susane", age: 38, job: "Technician")
      astronaut = Astronaut.create(name: "Scott", age: 42, job: "Technician")

      visit '/astronauts'

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
  end
end
