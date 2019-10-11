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

  describe "class methods" do
    it ".average_age" do
      astronaut = Astronaut.create(name: "Susane", age: 38, job: "Technician")
      astronaut = Astronaut.create(name: "Scott", age: 42, job: "Technician")

      visit '/astronauts'

      expect(Astronaut.average_age).to eq(40)

    end
  end
end
