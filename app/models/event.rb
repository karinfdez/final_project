class Event < ActiveRecord::Base
	#Events validations
	geocoded_by :location
	after_validation :geocode
	validates :title,:location,:description, :organizer_name,:event_type,presence: true
	validates :title,:organizer_name,length: { minimum: 1 }

	#To load images to the event (uploader/image_uploader)
	mount_uploader :image, ImageUploader

# Method to validate the start_date and end_date of the event
	validate :date_cannot_be_in_the_past
	
	def date_cannot_be_in_the_past
		if start_date.present? && start_date < Date.today
			errors.add(:start_date, "can't have a past date")
		elsif ends_date.present? && ends_date < Date.today
			errors.add(:ends_date, "can't have a past date") 
		end
	end

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
end
