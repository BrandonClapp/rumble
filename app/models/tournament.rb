class Tournament < ActiveRecord::Base

  validates :name, presence: true
  validates :team_size, presence: true;

  enum tournament_type: { ladder: 0, round_robin: 1 }

  belongs_to :league

  has_and_belongs_to_many :teams
  has_many :tournament_team_standings

end
