class Photo < ActiveRecord::Base
	validates :title, presence: true
    mount_uploader :image, ImageUploader
	# mount_uploaders :avatars, ImageUploader
end

