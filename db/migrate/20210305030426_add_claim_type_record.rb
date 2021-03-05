class AddClaimTypeRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :claims, :ct_record, :string
  end
end
