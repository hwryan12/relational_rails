class CompaniesController < ApplicationController
  def index
    @companies = 
    if params[:search]
      Company.search(params[:search])
    else
      Company.most_recent
    end
  end

  def show
    @company = Company.find(params[:id])
    @vessel_count = @company.vessel_count
  end

  def new
  end

  def create
    company = Company.create!(company_params)
    redirect_to '/companies'
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to "/companies/#{@company.id}"
  end

  def destroy
    @company = Company.find(params[:id])
    @company.vessels.destroy_all
    @company.destroy
    redirect_to "/companies"
  end

  private
    def company_params
      params.permit(:name, :tripadvisor_rank, :offering_cruises)
    end
end