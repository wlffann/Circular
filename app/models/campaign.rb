class Campaign < ApplicationRecord
  validates :street_address, presence: true, uniqueness: true

end
