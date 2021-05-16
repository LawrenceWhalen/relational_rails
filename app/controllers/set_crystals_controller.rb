#app/controllers/set_crystals_controller 

class SetCrystalsController < ApplicationController
  def index
    @set = CrystalSet.find(params[:crystal_set_id])
    @crystals = @set.crystals 
  end
end