class CrystalsController < ApplicationController
  def index
    @crystals = Crystal.all
  end
end