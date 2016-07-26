class Question < ActiveRecord::Base

  belongs_to :user

  validates :title, :presence => true 

  def self.title?(question)
    question.empty?
  end
  

end
