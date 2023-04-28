class AddPositionToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :position, :integer
  end
end
