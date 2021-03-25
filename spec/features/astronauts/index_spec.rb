require 'rails_helper'

RSpec.describe 'Astronaut Index Page' do
  before :each do
    @astronaut_list = create_list(:astronaut, 5)
    @astro1 = @astronaut_list.first
    @astro2 = @astronaut_list.second
    @astro3 = @astronaut_list.third
    @astro4 = @astronaut_list.fourth
    @astro5 = @astronaut_list.fifth
    
    @mission1 = Mission.create!(title: "Zulu", time_in_space: 444)
    @mission2 = Mission.create!(title: "Moon", time_in_space: 8854)
    @mission3 = Mission.create!(title: "Sagittarius A", time_in_space: 9965)

    AstronautMission.create(astronaut_id: @astro1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astro1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astro1.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astro2.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astro2.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astro2.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astro3.id, mission_id: @mission1.id)
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

  it 'can see a list of an astronauts missions in alphabetical order' do
    visit astronauts_path
    expect(current_path).to eq(astronauts_path)
    
    within(first('.astronaut')) do 
      expect(@mission2.title).to appear_before(@mission3.title)
      expect(@mission3.title).to appear_before(@mission1.title)
    end
  end
end
