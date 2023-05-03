class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.integer :time_in_space

      t.timestamps
    end
  end
end
