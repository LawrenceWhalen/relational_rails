#app/controllers/crystal_sets_controller.rb 

class CrystalSetsController < ApplicationController
  def index
    @crystal_sets = CrystalSet.all.order(:created_at).reverse_order 
  end

  def show
    @crystal_set = CrystalSet.find(params[:id])
  end

  def new
  end

  def create
    set = CrystalSet.create(crystal_set_params)

    redirect_to "/crystal_sets"
  end

  def edit
  end

  private
    def crystal_set_params 
      params.permit(:collection_name, :limited_edition, :inventory)
    end
end
