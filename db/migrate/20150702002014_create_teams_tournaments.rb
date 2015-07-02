class CreateTeamsTournaments < ActiveRecord::Migration
  def change
    create_table :teams_tournaments, :id => false do |t|
      t.references :team, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true
    end
  end
end
