class Tournament < ActiveRecord::Base
  enum tournament_type: { ladder: 0, round_robin: 1 }
  belongs_to :league
end
