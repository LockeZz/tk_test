class Department < ApplicationRecord
    has_many :claimtype_department
    has_many :claim_types, through: :claimtype_department
end
