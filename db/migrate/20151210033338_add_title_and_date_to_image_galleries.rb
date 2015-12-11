class AddTitleAndDateToImageGalleries < ActiveRecord::Migration
  def change
    add_column :image_galleries, :title, :string
    add_column :image_galleries, :date, :date
  end
end
