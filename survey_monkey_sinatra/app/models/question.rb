class Question < ActiveRecord::Base
  
  # ActiveRecord Associations
  belongs_to :survey
  has_many :answers

  # Database validations 
  validates :title, :presence => true 

  # Model methods
  def self.title?(question)
    question.empty?
  end
  

end
