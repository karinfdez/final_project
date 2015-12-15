class AddCascadeToCommentsForeignKey < ActiveRecord::Migration
  def change
  	remove_foreign_key :comments, :posts
	add_foreign_key :comments, :posts, on_delete: :cascade
  end
end
