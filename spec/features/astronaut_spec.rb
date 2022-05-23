require 'rails_helper'

RSpec.describe "Astronaut page" do
  it 'shows a list of all the astronauts' do
    neil = Astronaut.create!(name: "Neil", age: 1, job: "pilot")
    sally = Astronaut.create!(name: "Sally", age: 2, job: "commander")
    buzz = Astronaut.create!(name: "Buzz", age: 3, job: "co-pilot")
    visit '/astronauts'

    expect(page).to have_content("Neil")
    expect(page).to have_content("1")
    expect(page).to have_content("pilot")
    expect(page).to have_content("Sally")
    expect(page).to have_content("2")
    expect(page).to have_content("commander")
    expect(page).to have_content("Buzz")
    expect(page).to have_content("3")
    expect(page).to have_content("co-pilot")
    expect(page).to_not have_content("Sherman")

    # Astornaut.all.each do |astro|
    #   expect(page).to have_content(astronaut.name)
    #   expect(page).to have_content(astronaut.age)
    #   expect(page).to have_content(astronaut.job)
    # end
  end

  it 'shows the average age of all astronauts' do
    neil = Astronaut.create!(name: "Neil", age: 1, job: "pilot")
    sally = Astronaut.create!(name: "Sally", age: 2, job: "commander")
    buzz = Astronaut.create!(name: "Buzz", age: 3, job: "co-pilot")
    visit '/astronauts'

    expect(page).to have_content("Average age: 2")
  end

  it 'shows space missions in alphabetical order for each astronaut' do
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

    visit '/astronauts'

    within "##{neil.id}" do
      expect("Apollo").to appear_before("Capricorn")
      expect("Capricorn").to appear_before("Gemini")
    end

    within "##{sally.id}" do
      expect("Capricorn").to appear_before("Gemini")
    end

    within "##{buzz.id}" do
      expect(page).to have_content("Apollo")
    end
  end

  it 'shows total time in space by each astronaut' do
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

    visit '/astronauts'

    within "##{neil.id}" do
      expect(page).to have_content("Total time in space: 7")
    end

    within "##{sally.id}" do
      expect(page).to have_content("Total time in space: 5")
    end

    within "##{buzz.id}" do
      expect(page).to have_content("Total time in space: 2")
    end
  end
end
