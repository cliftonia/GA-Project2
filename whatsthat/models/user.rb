class User < ActiveRecord::Base
  has_many :comments #adds methods to user

  validates_with EmailAddress::ActiveRecordValidator, field: :email
  has_secure_password

  # this will add some new methods for user for you
  # .password = 'pudding' you can pass in the original 
  # .password will pass it to bycrypt to digest it for you

  # password_digest - the naming is a convention of has has_secure_password

  # .authenticate('happy-tails')
  # returns the user object if the password matches 
  # else return nill

end