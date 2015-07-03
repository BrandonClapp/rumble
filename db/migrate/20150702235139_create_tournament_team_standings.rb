class CreateTournamentTeamStandings < ActiveRecord::Migration
  def change
    create_table :tournament_team_standings do |t|
      t.references :tournament, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.integer :points

      t.timestamps null: false
    end
  end
end
