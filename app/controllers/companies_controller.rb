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
    company = Company.create!({name: params[:name], 
    tripadvisor_rank: params[:tripadvisor_rank], 
    offering_cruises: params[:offering_cruises]})
    redirect_to '/companies'
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update({name: params[:name], 
    tripadvisor_rank: params[:tripadvisor_rank], 
    offering_cruises: params[:offering_cruises]})
    redirect_to "/companies/#{@company.id}"
  end

  def destroy
    @company = Company.find(params[:id])
    @company.vessels.destroy_all
    @company.destroy
    redirect_to "/companies"
  end
end