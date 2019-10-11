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

  describe 'Class methods' do
    it "Can caluculate the average age of all astronauts" do
      neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      buzz = Astronaut.create(name: "Buzz Aldrin", age: 34, job: "Lunar Module Pilot")

      expect(Astronaut.avg_age).to eq(35.5)

    end
  end

  describe 'Instance methods' do
    it "Can calculate each astronauts days in space" do
      neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      apollo = Mission.create(title: "Apollo 11", time_in_space: 8)
      gemini_8 = Mission.create(title: "Gemini 8", time_in_space: 1)
      neilapollo = AstronautMission.create(astronaut_id: neil.id, mission_id: apollo.id)
      neilgemini = AstronautMission.create(astronaut_id: neil.id, mission_id: gemini_8.id)
      expect(neil.space_days).to eq(9)
    end
  end
end
