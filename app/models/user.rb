

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable 
         # :timeoutable 
         # :registerable  This was to remove the sign up
  
  #This is call on every model I will need to upload an image
  mount_uploader :image,ImageUploader
  #Validations
  #Minimum 2 characters per name. Maximum 50 characters.
	validates :first_name,:last_name,presence: true, length: { in: 1..50 }
	validates :password, length: { maximum: 50 }
  
  has_many :comments
  has_many :posts
  # Live chat
  # Because the user_id column isn't on the conversation table,
  # it's assign this foreign in order for rails know wich table user is related.
  has_many :conversations, :foreign_key => :sender_id


   # has_attached_file :video,
   #  styles: lambda { |a| a.instance.is_image? ? {:small => "x200>", :medium => "x300>", :large => "x400>"}  : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10}, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10}}},
   #  processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
 
 has_attached_file :video, styles: {
          :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
       :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

end
