require 'rails_helper'

RSpec.feature "user views campaigns" do

  before :all do
    @campaigns = create_list(:campaign, 2)
  end

  context "user can view campaigns from the navbar" do
    scenario "user sees all campaigns" do
      visit root_path

      click_link "Search"

      expect(current_path).to eq(campaigns_path)
      expect(page).to have_content(@campaigns.first.street_address)
      expect(page).to have_content(@campaigns.second.street_address)
    end

    scenario "user sees details of one campaign" do
      visit campaigns_path

      click_link "#{@campaigns.first.street_address}"

      expect(current_path).to eq(campaign_path(@campaigns.first))
      expect(page).to have_content(@campaigns.first.street_address)
      expect(page).to have_content("Vote Count: 1")
    end
  end
end
