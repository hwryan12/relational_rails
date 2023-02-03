class VesselsController < ApplicationController
  def index
    @vessels = Vessel.all
  end

  def show
    @vessel = Vessel.find(params[:id])
  end
end