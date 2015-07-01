class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.boolean :enabled
      t.string :name
      t.column :tournament_type, :integer, default: 0
      t.integer :team_size
      t.references :league, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
