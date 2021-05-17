#app/controllers/set_crystals_controller 

class SetCrystalsController < ApplicationController
  def index
    @set = CrystalSet.find(params[:id])
    @crystals = @set.crystals 
  end
end