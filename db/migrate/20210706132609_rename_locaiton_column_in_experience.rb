class RenameLocaitonColumnInExperience < ActiveRecord::Migration[6.1]
  def change
    rename_column :experiences, :locaiton, :location
  end
end
