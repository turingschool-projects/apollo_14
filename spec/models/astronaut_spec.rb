require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it ".average_age" do
      neil = Astronaut.create!(name: "Neil", age: 1, job: "pilot")
      sally = Astronaut.create!(name: "Sally", age: 2, job: "commander")
      buzz = Astronaut.create!(name: "Buzz", age: 3, job: "co-pilot")

      expect(Astronaut.average_age).to eq(2)
    end
  end

  describe 'instance methods' do
    it "#alpha_missions" do
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

      expect(neil.alpha_missions).to eq([mission_2, mission_3, mission_1])
      expect(sally.alpha_missions).to eq([mission_3, mission_1])
      expect(buzz.alpha_missions).to eq([mission_2])
    end

    it "#total_time_in_space" do
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

      expect(neil.total_time_in_space).to eq(7)
      expect(sally.total_time_in_space).to eq(5)
      expect(buzz.total_time_in_space).to eq(2)
    end
  end
end
