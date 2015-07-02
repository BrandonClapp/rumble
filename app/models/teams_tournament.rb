class TeamsTournament < ActiveRecord::Base
  belongs_to :team
  belongs_to :tournament
end
