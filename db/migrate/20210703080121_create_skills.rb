class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :level
      t.integer :years_of_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
