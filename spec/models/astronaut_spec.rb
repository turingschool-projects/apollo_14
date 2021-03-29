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

  describe 'instance methods' do 
    it 'can find the average age of all astronauts' do
      astro1 = Astronaut.create(name: "Jim Bob", age: 33, job: "Pilot")
      astro1 = Astronaut.create(name: "Sue Bob", age: 55, job: "Captain")
      astro1 = Astronaut.create(name: "Dani Bob", age: 40, job: "First Mate")

      all_astros = Astronaut.all
      average_age = all_astros.average_age

      expect(average_age).to eq(42.67)
    end
  end
end
