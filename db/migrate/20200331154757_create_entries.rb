class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.boolean :feeding_day
      t.boolean :watering_day
      t.boolean :defoil
      t.boolean :training_applied
      t.float :water_ph_levels
      t.float :soil_ph_levels
      t.string :nutrients_used
      t.integer :temp
      t.integer :relative_humidity
      t.string :training
      t.text :explanation
      t.text :notes
      t.references :journal, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end
