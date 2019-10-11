class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions
  # helper_method :mission_for_astronaut

  def mission_for_astronaut
    self.missions.order(:title)
  end

  def total_time_in_space
    self.missions.select(:time_in_space).sum(:time_in_space)
  end
end
