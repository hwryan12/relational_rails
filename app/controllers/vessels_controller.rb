class VesselsController < ApplicationController
  def index
    @vessels = Vessel.all
  end
end