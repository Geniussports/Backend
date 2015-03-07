class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|

      t.timestamps null: false
    end
  end
end
