class CompaniesController < ApplicationController
  def index
    @companies = Company.most_recent
  end

  def show
    @company = Company.find(params[:id])
    @vessel_count = @company.vessel_count
  end

  def new
  end

  def create
    company = Company.create(name: params[:name], 
    tripadvisor_rank: params[:tripadvisor_rank], 
    offering_cruises: params[:offering_cruises])
    redirect_to '/companies'
  end
end