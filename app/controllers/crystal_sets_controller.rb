#app/controllers/crystal_sets_controller.rb 

class CrystalSetsController < ApplicationController
  def index
    @crystal_sets = CrystalSet.all
  end

  def show
    @crystal_set = CrystalSet.find(params[:id])
  end
end
