class Player < ActiveRecord::Base
  has_many :families
  has_many :team_players
  has_many :users, through: :families
  has_many :teams, through: :team_players

  
end
