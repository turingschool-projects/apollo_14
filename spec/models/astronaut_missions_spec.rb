require 'rails_helper'

RSpec.describe AstronautMission, type: :model do
  describe 'Relationships' do
    it { should have_many :astronauts }
    it { should have_many :missions }
  end
end
