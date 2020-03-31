class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :garden_name
      t.string :garden_type
      t.string :garden_medium
      t.references :user, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end
