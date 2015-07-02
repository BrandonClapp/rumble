class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.references :initiating_team
      t.references :defending_team
      t.references :tournament
      t.string :map_name

      t.timestamps null: false
    end
  end
end
