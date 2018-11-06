class CreateGameResults < ActiveRecord::Migration[5.1]
  def change
    create_table :game_results do |t|
      t.references :match, foreign_key: true
      t.string :match_result

      t.timestamps
    end
  end
end
