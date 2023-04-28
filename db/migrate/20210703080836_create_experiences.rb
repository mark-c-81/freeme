class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :experience_name
      t.string :company
      t.string :role
      t.datetime :start_date
      t.datetime :end_date
      t.string :locaiton
      t.string :website_url
      t.string :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
