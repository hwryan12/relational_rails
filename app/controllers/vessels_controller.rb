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
    @vessel.update(vessel_params)
    redirect_to "/vessels/#{@vessel.id}"
  end

  def destroy
    @vessel = Vessel.find(params[:id])
    @vessel.destroy
    redirect_to '/vessels'
  end

  private
    def vessel_params
      params.permit(:name, :year_built, :operational)
    end
end