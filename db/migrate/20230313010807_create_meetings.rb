class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :description
      t.string :meeting_link
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
