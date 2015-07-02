class Match < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :initiating_team, class_name: "Team", foreign_key: "initiating_team_id"
  belongs_to :defending_team, class_name: "Team", foreign_key: "defending_team_id"
end
