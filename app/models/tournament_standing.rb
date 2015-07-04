class TournamentStanding < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :roster
  # :points -> integer
end
