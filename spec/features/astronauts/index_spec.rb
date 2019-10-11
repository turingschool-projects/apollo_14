require 'rails_helper'

RSpec.describe "astronauts show page" do
  before(:each) do
    @astronaut_1 = Astronaut.create(name: "John Spackleton", age: 42, job: "Commander")
    @astronaut_2 = Astronaut.create(name: "Bob Johnson", age: 35, job: "Pilot")
    @astronaut_3 = Astronaut.create(name: "Michael Schwartz", age: 37, job: "Flight Controller")
  end
  it "can show a list of astronauts with attributs" do
    visit '/astronauts'

    within "#astronaut-#{@astronaut_1.id}" do
      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_1.age)
      expect(page).to have_content(@astronaut_1.job)

      expect(page).to_not have_content(@astronaut_2.name)
    end

    within "#astronaut-#{@astronaut_2.id}" do
      expect(page).to have_content(@astronaut_2.name)
      expect(page).to have_content(@astronaut_2.age)
      expect(page).to have_content(@astronaut_2.job)

      expect(page).to_not have_content(@astronaut_1.name)
    end
  end

  it "can show average age of all astronauts" do
    visit '/astronauts'

    expect(page).to have_content('Average Age: 38')
  end
end
