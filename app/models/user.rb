class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, :dependent => :destroy
  has_many :teams, through: :memberships

  def is_member_of?(team)
    if !self.teams.empty?    
      self.teams.exists?(id: team.id)
    else
      false
    end
  end
end
