class Team < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, through: :memberships

  has_and_belongs_to_many :tournaments

  def initiated_matches
    Match.where('initiating_team_id = ?', self.id)
  end

  def defended_matches
    Match.where('defending_team_id = ?', self.id)
  end

  def matches 
    initiated_matches + defended_matches
  end

end
