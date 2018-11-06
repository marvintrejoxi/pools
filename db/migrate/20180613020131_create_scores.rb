class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true
      t.string :match_score
      t.boolean :successful_forecast, default: false

      t.timestamps
    end
  end
end
