class ClaimType < ApplicationRecord
    has_many :claim, dependent: :nullify

    has_many :claimtype_department, dependent: :nullify
    has_many :departments, through: :claimtype_department, dependent: :nullify
end
