class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :journal_name
      t.string :journal_type
      t.boolean :archive
      t.references :user, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end
