# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  users_description      :string
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable ,:timeoutable 
         # :registerable  This was to remove the sign up
  
  #This is call on every model I will need to upload an image
  mount_uploader :image,ImageUploader
  #Validations
  #Minimum 2 characters per name. Maximum 50 characters.
	validates :first_name,:last_name,presence: true, length: { in: 1..50 }
	validates :password, length: { maximum: 50 }
  
  has_many :comments
  has_many :posts

end
