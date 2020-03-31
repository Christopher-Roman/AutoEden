class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, index: { unique: true }
      t.string :user_email, index: { unique: true }
      t.integer :gardening_experience
      t.string :nickname
      t.string :preferred_pronoun
      t.string :favorite_plant
      t.string :pref_gardening_medium
      t.string :country
      t.string :state_or_province

      t.timestamps
    end
  end
end
