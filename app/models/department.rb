class Department < ApplicationRecord
    has_many :claimtype_department, dependent: :nullify
    has_many :claim_types, through: :claimtype_department, dependent: :nullify
end
