class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.find_by(street_address: campaign_params[:street_address]);
    if !@campaign
      @campaign = Campaign.create(campaign_params)
      if @campaign.save
        flash[:success] = "A campaign was created for #{@campaign.street_address}. Thank you!"
        redirect_to campaign_path(@campaign)
      else
        flash[:warning] = @campaign.errors.full_messages.join(", ")
        redirect_to root_path
      end
    else
      flash[:success] = "A campaign already exists for #{@campaign.street_address}!"
      redirect_to campaign_path(@campaign)
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:street_address)
  end

end
