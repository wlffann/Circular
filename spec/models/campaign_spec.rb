require 'rails_helper'

RSpec.describe Campaign, type: :model do

  context "validations" do
    it "is not valid without street address" do
      expect(build_stubbed(:campaign, street_address: "")).not_to be_valid
    end

    it "is not valid with a duplicate street address" do
      campaign = create(:campaign)
      expect(build(:campaign, street_address: campaign.street_address)).not_to be_valid
    end

    it "is valid with a correct street address" do
      expect(build_stubbed(:campaign)).to be_valid
    end

    it "is created with a vote count of 1" do
      campaign = build_stubbed(:campaign)
      expect(campaign.vote_count).to eq(1)
    end
  end
end
