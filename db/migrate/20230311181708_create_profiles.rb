class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birth
      t.string :phone
      t.string :country
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
