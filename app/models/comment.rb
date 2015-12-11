class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :commenter,:body,presence: true
end
