require 'rails_helper'

describe AstronautMission, type: :model do
  describe 'Validations' do
  end

  describe 'Relationships' do
    it { should belong_to :astronaut}
    it { should belong_to :mission}
  end
end
