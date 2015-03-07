class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id, index: true
      t.integer :team_id, index: true
      t.boolean :manager
      t.boolean :parent
      t.boolean :coach
      t.timestamps null: false
    end
  end
end
