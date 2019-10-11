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

  it "should return all missions" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    apollo = astronaut.missions.create(title: 'Apollo', time_in_space: 13)
    cap = astronaut.missions.create(title: 'Capricorn', time_in_space: 4)
    gem = astronaut.missions.create(title: 'Gemini', time_in_space: 7)

    expect(astronaut.mission_for_astronaut).to eq([apollo, cap, gem])
  end

  it "should return time in space" do
    astronaut = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    apollo = astronaut.missions.create(title: 'Apollo', time_in_space: 13)
    cap = astronaut.missions.create(title: 'Capricorn', time_in_space: 4)
    gem = astronaut.missions.create(title: 'Gemini', time_in_space: 7)

    expect(astronaut.total_time_in_space).to eq(24)
  end
end
