#app/controllers/crystals_controller.rb 

class CrystalsController < ApplicationController
  def index
    @crystals = Crystal.show_only_true
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

  def destroy
    crystal = Crystal.find(params[:id])
    crystal.destroy 

    redirect_to '/crystals'
  end

  private
    def crystal_params
      params.permit(:name, :price, :charged, :description)
    end
end