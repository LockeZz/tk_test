class CreateClaimtypeDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :claimtype_departments do |t|
      t.references :claim_type, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
