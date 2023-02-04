class CompaniesVesselsController < ApplicationController
  def index
    company = Company.find(params[:company_id])
    @vessels = company.vessels  
  end
end