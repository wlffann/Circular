class HomesController < ApplicationController

  def index
    @campaign = Campaign.new
    @campaigns = Campaign.all
  end

  def show

  end


end
