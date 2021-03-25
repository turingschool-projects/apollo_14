require 'rails_helper'

RSpec.describe 'Astronaut Index Page' do
  before :each do
    @astronaut_list = create_list(:astronaut, 5)
    @astro1 = @astronaut_list.first
    @astro2 = @astronaut_list.second
    @astro3 = @astronaut_list.third
    @astro4 = @astronaut_list.fourth
    @astro5 = @astronaut_list.fifth
    # @astronaut1 = create(:astronaut)
    # @astronaut2 = create(:astronaut)
    # @astronaut3 = create(:astronaut)
    # @astronaut4 = create(:astronaut)
    # @astronaut5 = create(:astronaut)
  end

  it "can see a list of astronauts with name, age, job" do
    visit '/astronauts'

    expect(page).to have_css('.astronaut', count: 5)
    expect(page).to have_content("Apollo 14 Astronauts")
    
    within(first('.astronaut')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.age')
      expect(page).to have_css('.job')
    end
  end

  it 'can show the average age of all astronauts' do
    visit astronauts_path
    expect(current_path).to eq('/astronauts')
    all_astros = Astronaut.all
    average_age = all_astros.average_age 
    expect(page).to have_content("Average age of all astronauts: #{average_age}")
  end
end
