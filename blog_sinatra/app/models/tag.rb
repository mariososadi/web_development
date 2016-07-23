class Tag < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :lists
  has_many :posts, through: :lists
end
