FactoryGirl.define do

  factory :apartment do
    street_address "Delaware Street, Denver, CO"
    trait :with_petition do
      after(:create) do |apt|
        apt.petition = create(:petition, apartment: apt)
      end
    end
  end

  factory :petition do
    apartment
  end
end
