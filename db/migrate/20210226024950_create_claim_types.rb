class CreateClaimTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :claim_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
