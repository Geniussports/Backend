class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :user_id
      t.integer :player_id
      t.string :relationship
      t.timestamps null: false
    end
  end
end
