class AddPositionToSkill < ActiveRecord::Migration[6.1]
  def change
    add_column :skills, :position, :integer
  end
end
