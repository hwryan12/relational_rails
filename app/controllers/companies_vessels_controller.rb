class CompaniesVesselsController < ApplicationController
  def index
    company = Company.find(params[:company_id])
    @vessels = company.vessels
      # binding.pry   
  end
end