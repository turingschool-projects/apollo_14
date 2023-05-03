class CreateAstronautMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :astronaut_missions do |t|
      t.references :astronaut, foreign_key: true
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
