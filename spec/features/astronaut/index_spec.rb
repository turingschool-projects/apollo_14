require 'rails_helper'

describe "Astronaut index page" do
  it "can list of astronauts with the following info" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    visit '/astronauts'
    expect(page).to have_content('Name: Neil Armstrong')
    expect(page).to have_content('Age: 37')
    expect(page).to have_content('Job: Commander')
  end

  it "Can show average age" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'David', age: 34, job: 'Master')
    visit '/astronauts'
    expect(page).to have_content('Average Age: 36')
  end

  it "lists all missions in order by name" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    astronaut.missions.create(title: 'Apollo', time_in_space: 13)
    astronaut.missions.create(title: 'Capricorn', time_in_space: 4)
    astronaut.missions.create(title: 'Gemini', time_in_space: 7)
    visit '/astronauts'
    expect(page).to have_content("Apollo, 13")
    expect(page).to have_content("Capricorn, 4")
    expect(page).to have_content("Gemini, 7")
  end

  it "can list total time in space" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    astronaut.missions.create(title: 'Apollo', time_in_space: 13)
    astronaut.missions.create(title: 'Capricorn', time_in_space: 4)
    astronaut.missions.create(title: 'Gemini', time_in_space: 7)
    visit '/astronauts'
    expect(page).to have_content("Total time in space: 24")
  end
end
