class Team < ActiveRecord::Base
  has_many :roles
  has_many :team_players
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
      {id: user.id, email: user.email, role: user_role(user)}
     end
  end

  def json_players
    self.players.map do |player|
      {id: player.id, name: player.name }
    end
  end
end
