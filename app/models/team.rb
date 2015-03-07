class Team < ActiveRecord::Base
  has_many :roles
  has_many :team_players
  has_many :users, through: :roles
  has_many :players, through: :team_players
end
