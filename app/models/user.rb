class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  has_many :families
  has_many :roles
  has_many :players, through: :families
  has_many :teams, through: :roles

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def as_json(opts={})
    options = {:only => [:name, :phone_number, :email, :id, :authentication_token]}
    options.merge!(opts)
    super(options)
  end

  def relationship(player, relationship)
    Family.find_by_user_id_and_player_id(self.id, player.id).
           update(relationship: relationship)
  end

  private
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end

end
