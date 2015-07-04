class Team < ActiveRecord::Base
  # has_many :memberships, :dependent => :destroy
  # has_many :users, through: :memberships

  has_many :rosters

  # has_and_belongs_to_many :tournaments

  def opponent_for(match)
    if match.initiating_team == self
      match.defending_team
    elsif match.defending_team == self
      match.initiating_team
    end
  end

  def role_for(match)
    if match.initiating_team == self
      "Initiator"
    elsif match.defending_team == self
      "Defender"
    end
  end

  def initiated_matches
    Match.where(initiating_team: self)
  end

  def defended_matches
    Match.where(defending_team: self)
  end

  def matches 
    Match.where('initiating_team_id = ? OR defending_team_id = ?', self, self)
  end

end
