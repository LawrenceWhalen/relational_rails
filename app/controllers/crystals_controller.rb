#app/controllers/crystals_controller.rb 

class CrystalsController < ApplicationController
  def index
    @crystals = Crystal.all
  end

  def show
    @crystal = Crystal.find(params[:id])
  end

  def edit
  end
end