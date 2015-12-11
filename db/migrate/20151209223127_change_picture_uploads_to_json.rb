class ChangePictureUploadsToJson < ActiveRecord::Migration
  def change
  	remove_column :image_galleries, :picture
  	add_column :image_galleries, :picture, :json
  end
end
