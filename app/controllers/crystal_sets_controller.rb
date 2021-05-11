#app/controllers/crystal_sets_controller.rb 

class CrystalSetsController < ApplicationController
  def index
    @crystal_set = CrystalSet.all
  end
end
