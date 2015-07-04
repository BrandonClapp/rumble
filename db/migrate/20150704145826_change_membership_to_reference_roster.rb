class ChangeMembershipToReferenceRoster < ActiveRecord::Migration
  def change
    rename_column :memberships, :team_id, :roster_id
  end
end
