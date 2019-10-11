class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.avg_age
    average(:age).round(1)
  end

  def space_days(id)
    astro_missions = AstronautMission.where(astronaut_id: id)
    missions = Mission.find(astro_missions.pluck(:mission_id))
    missions.pluck(:time_in_space).sum
  end
end
