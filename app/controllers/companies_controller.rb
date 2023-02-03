class CompaniesController < ApplicationController
  def index
    @companies = Company.most_recent
  end

  def show
    @company = Company.find(params[:id])
  end
end