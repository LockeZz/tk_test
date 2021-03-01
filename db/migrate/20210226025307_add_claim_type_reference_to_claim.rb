class AddClaimTypeReferenceToClaim < ActiveRecord::Migration[6.1]
  def change
    add_reference :claims, :claim_type, foreign_key: true, index: true
  end
end
