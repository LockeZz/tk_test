class ClaimtypeDepartment < ApplicationRecord
  belongs_to :claim_type
  belongs_to :department
end
