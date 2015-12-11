class ImageGallery < ActiveRecord::Base
	mount_uploaders :picture, ImageUploader

	validates :title,:date,:picture, presence: true
	validates :title, length: { in: 1..50 }
	
end
