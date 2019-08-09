class Comment < ActiveRecord::Base
  belongs_to :user #adds new methods to comment objects for me eg .user
  belongs_to :picture
  validates :body, length: { in: 2..2000 , message: "Comment is to short"}
end