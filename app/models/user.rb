class User < ActiveRecord::Base

  after_initialize :set_default_role, :if => :new_record?

  enum role: {user: 0, community_manager: 10, admin: 20 }

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

  def is_manager_of?(team)
    # todo: implement me
  end

  def admin?
    if !self.role.nil?
      self.role.intern == :admin
    else
      false
    end
  end

  def community_manager?
    if !self.role.nil?
      self.role.intern == :community_manager
    else
      false
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end

end
