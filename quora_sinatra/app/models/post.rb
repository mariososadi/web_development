class Post < ActiveRecord::Base

  validates :body, :presence => true
  validates :title, :presence => true
  validates :title, :uniqueness => true
  
  has_many :lists
  has_many :tags, through: :lists

  def self.title_body?(title, body)

    title.empty? || body.empty?
  end 


end
