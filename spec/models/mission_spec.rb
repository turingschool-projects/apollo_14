require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'instance methods' do
    it "can find the total time in space for all astronauts" do
      mission1 = Mission.create!(title: "Zulu", time_in_space: 444)
      mission2 = Mission.create!(title: "Moon", time_in_space: 8854)
      mission3 = Mission.create!(title: "Sagittarius A", time_in_space: 9965)

      expect(Mission.total_time_in_space).to eq(19263)
    end
  end
end
