class CreateTournamentStandings < ActiveRecord::Migration
  def change
    create_table :tournament_standings do |t|
      t.references :tournament, index: true, foreign_key: true
      t.references :roster, index: true, foreign_key: true
      t.integer :points

      t.timestamps null: false
    end
  end
end
