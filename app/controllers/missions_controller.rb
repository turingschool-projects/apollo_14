class AstronautsController < ApplicationController

  def index
    @missions = Mission.all
  end
end
