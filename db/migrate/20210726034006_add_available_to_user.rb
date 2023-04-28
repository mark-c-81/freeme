class AddAvailableToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :available, :boolean, default: true
  end
end
