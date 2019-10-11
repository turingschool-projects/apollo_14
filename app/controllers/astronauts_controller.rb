class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
  end

  def average_age
    binding.pry
    average_age = (@astronauts.sum {|astronaut| astronaut.age}) / @astronauts.count
  end
end
