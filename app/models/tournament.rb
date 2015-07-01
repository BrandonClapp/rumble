class Tournament < ActiveRecord::Base

  validates :name, presence: true
  validates :team_size, presence: true;

  enum tournament_type: { ladder: 0, round_robin: 1 }
  belongs_to :league
end
