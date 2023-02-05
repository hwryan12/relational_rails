class CompaniesVesselsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @vessels = if params[:sort_by] == 'name'
      @company.vessels.order(:name)
    elsif params[:year_built]
      @company.vessel_built_after(params[:year_built])
    else
      @company.vessels
    end
  end

  def new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id]) 
    @company.vessels.create!({name: params[:name], 
    year_built: params[:year_built], 
    operational: params[:operational]})
    redirect_to "/companies/#{@company.id}/vessels"
  end
end