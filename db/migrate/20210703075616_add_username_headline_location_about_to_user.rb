class AddUsernameHeadlineLocationAboutToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :headline, :string
    add_column :users, :location, :string
    add_column :users, :about, :text
  end
end
