class CrystalSetsController < ApplicationController
  def index
    @crystal_set = CrystalSet.all
  end
end