class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :plant_name
      t.string :plant_type
      t.string :growth_state
      t.boolean :flowering
      t.references :garden, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end
