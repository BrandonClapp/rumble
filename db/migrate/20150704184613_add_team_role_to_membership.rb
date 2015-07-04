class AddTeamRoleToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :team_role, :integer
  end
end
