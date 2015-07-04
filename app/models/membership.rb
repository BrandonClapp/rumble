class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :roster

  enum team_role: { member: 0, manager: 1 }
end
