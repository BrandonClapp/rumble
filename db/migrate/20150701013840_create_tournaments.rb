class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :tournament_type
      t.references :league, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
