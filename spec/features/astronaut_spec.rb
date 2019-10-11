require 'rails_helper'

describe Astronaut, type: :feature do

  describe 'As a visitor' do
    describe 'when I visit the astronauts show page' do
      it 'I see a list of astronauts and their info' do

        astronaut = Astronaut.create(Name: "Neil Armstrong", Age: 37, Job: "Commander")

        visit '/astronauts'

        expect(page).to have_content("Neil Armstrong")
        expect(page).to have_content(37)
        expect(page).to have_content("Commander")
      end
    end
  end

end
