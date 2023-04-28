class AddCvToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cv, :string
  end
end
