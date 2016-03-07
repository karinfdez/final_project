class AddVideoToUsers < ActiveRecord::Migration
  def change
  	def up
    add_attachment :users, :video
  end

  def down
    remove_attachment :users, :video
  end
  end
end
