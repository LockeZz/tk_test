class AddStaffReferenceToClaim < ActiveRecord::Migration[6.1]
  def change
    add_reference :claims, :staff, foreign_key: true, index: true
  end
end
