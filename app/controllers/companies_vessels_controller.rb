class CompaniesVesselsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @vessels = if params[:sort_by] == 'name'
      @company.vessels.order(:name)
    elsif params[:length]
      @company.vessel_length(params[:length])
    else
      @company.vessels
    end
  end

  def new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id]) 
    @company.vessels.create!(vessel_params)
    redirect_to "/companies/#{@company.id}/vessels"
  end

  private
    def vessel_params
      params.permit(:name, :length, :year_built, :operational)
    end
end