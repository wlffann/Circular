require 'rails_helper'

RSpec.describe Petition, type: :model do
  context "validations" do
    it "is created with a vote count of 1" do
      apartment = create(:apartment, :with_petition)
      expect(apartment.petition.vote_count).to eq(1)
    end
  end

  it "should not create a petition if one already exists for apartment" do
    petition = create(:petition)
    apt = Apartment.first
    copy_petition = build(:petition, apartment: apt)
    expect(Petition.count).to eq(1)
    expect(copy_petition).not_to be_valid
    expect(Petition.count).to eq(1)
  end

end
