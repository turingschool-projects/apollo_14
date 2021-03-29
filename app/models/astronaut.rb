class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age).to_f.round(2)
  end

  def sorted_missions
    missions.order('title')
  end
end
