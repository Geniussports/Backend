class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.string :date
      t.string :time
      t.string :opponent

      t.timestamps null: false
    end
  end
end
