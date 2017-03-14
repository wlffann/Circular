FactoryGirl.define do

  factory :campaign do
    sequence(:street_address) { |n| "#{n} Delaware Street, Denver, CO" }
  end
end
