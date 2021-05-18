#app/controllers/set_crystals_controller 

class SetCrystalsController < ApplicationController
  def index
    @crystal_set = CrystalSet.find(params[:id])
    @crystals = @crystal_set.crystals 
  end

  def new 
    @crystal_set = CrystalSet.find(params[:id])
  end

  def create
    @crystal_set = CrystalSet.find(params[:id])
    @crystal_set.crystals.create(crystal_params)

    redirect_to "/crystal_sets/#{@crystal_set.id}/crystals"
  end

   #add crystal set id - because it's not tied to any parent 

  private
    def crystal_params
      params.permit(:name, :price, :charged, :description)
    end
end