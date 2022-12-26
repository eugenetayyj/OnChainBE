class Contract < ApplicationRecord
    validates :userAddress, presence: true
    validates :deployedAddress, presence: true
    self.primary_key = :deployedAddress
end
