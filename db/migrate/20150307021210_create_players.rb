class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :medical_name
      t.string :medical_number
      t.text :medical_info
      t.timestamps null: false
    end
  end
end
