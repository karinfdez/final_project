class RemoveNameFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :name, :string
  end
end
