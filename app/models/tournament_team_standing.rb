class TournamentTeamStanding < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :team
  # :points -> integer
end
