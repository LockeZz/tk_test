class CreateClaimtypeDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :claimtype_departments do |t|
      t.references :claim_type, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
