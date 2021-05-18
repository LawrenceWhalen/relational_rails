#app/controllers/crystals_controller.rb 

class CrystalsController < ApplicationController
  def index
    @crystals = Crystal.all
  end

  def show
    @crystal = Crystal.find(params[:id])
  end

  def edit
    @crystal = Crystal.find(params[:id])
  end

  def update
    crystal = Crystal.find(params[:id])
    crystal.update(crystal_params)

    redirect_to "/crystals/#{crystal.id}"
  end

  private
    def crystal_params
      params.permit(:name, :price, :charged, :description)
    end
end