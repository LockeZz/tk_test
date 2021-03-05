class Claim < ApplicationRecord
    belongs_to :claim_type
    belongs_to :staff
end
