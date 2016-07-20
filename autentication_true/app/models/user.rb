class User < ActiveRecord::Base
  
  has_many :urls

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :presence => true

end

