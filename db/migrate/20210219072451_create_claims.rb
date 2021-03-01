class CreateClaims < ActiveRecord::Migration[6.1]
  def change
    create_table :claims do |t|
      t.string :claim_name
      t.decimal :amount
      t.date :claim_date

      t.timestamps
    end
  end
end
