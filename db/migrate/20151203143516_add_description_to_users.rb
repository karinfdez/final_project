class AddDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :users_description, :string
  end
end
