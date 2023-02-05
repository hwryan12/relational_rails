class VesselsController < ApplicationController
  def index
    @vessels = Vessel.where(operational: true)
  end

  def show
    @vessel = Vessel.find(params[:id])
  end

  def edit 
    @vessel = Vessel.find(params[:id])
  end

  def update
    @vessel = Vessel.find(params[:id])
    @vessel.update({name: params[:name], 
    year_built: params[:year_built], 
    operational: params[:operational]})
    redirect_to "/vessels/#{@vessel.id}"
  end
end