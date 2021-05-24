class CreateMaillists < ActiveRecord::Migration[6.1]
  def change
    create_table :maillists do |t|
      t.text :mails, default: [].to_yaml

      t.timestamps
    end
  end
end
