class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :local_team
      t.string :visiting_team
      t.date :match_date
      t.time :match_hour
      t.string :group
      t.string :tournamen_phase

      t.timestamps
    end
  end
end
