class Team < ActiveRecord::Base
  has_many :roles
  has_many :team_players
  has_many :games
  has_many :users, through: :roles
  has_many :players, through: :team_players


  def user_role(user)
    role = Role.where(user_id: user.id, team_id: self.id).first
    if role
      if role.manager?
        'manager'
      elsif role.coach?
        'coach'
      else
        'parent'
      end
    end
  end

  def json_coaches
    self.users.where('manager=? OR coach=?', true, true).map do |user|
      {id: user.id, name: user.name, phone_number: user.phone_number,
        email: user.email, role: user_role(user)}
     end
  end

  def json_players
    self.players.map do |player|
      {id: player.id, name: player.name }
    end
  end

  def json_games
    self.games.map do |game|
      {id: game.id, location: game.location, date: game.date, time: game.time,
        opponent: game.opponent, team_id: self.id}
    end
  end
end
