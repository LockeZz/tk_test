class ClaimType < ApplicationRecord
    has_many :claim

    has_many :claimtype_department
    has_many :departments, through: :claimtype_department
end
