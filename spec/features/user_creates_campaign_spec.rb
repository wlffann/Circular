require 'rails_helper'

RSpec.feature "User creates a campaign" do
  scenario "User enters address that has no campaign" do
    visit root_path

    fill_in "street_address", with: "1000 Broadway"
    click_on "Submit"

    expect(current_path).to eq campaign_path(Campaign.last)
    expect(page).to have_content("A campaign was created for 1000 Broadway")
    expect(Campaign.count).to eq(1)
  end

  scenario "User enters addresss for an existing campaign" do

    campaign = create(:campaign)
    expect(Campaign.count).to eq(1)

    visit root_path

    fill_in "street_address", with: campaign.street_address
    click_on "Submit"

    expect(current_path).to eq campaign_path(campaign)
    expect(page).to have_content("A campaign already exists for #{campaign.street_address}")
    expect(Campaign.count).to eq(1)
  end

  scenario "User enters empty addresss for apartment and receives an error" do

    visit root_path
    fill_in "street_address", with: ""
    click_on "Submit"
    expect(current_path).to eq root_path
    expect(page).to have_content("Street address can't be blank")
    expect(Campaign.count).to eq(0)
  end

end
