class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true

end

