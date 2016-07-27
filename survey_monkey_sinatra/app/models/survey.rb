class Survey < ActiveRecord::Base
  
  # ActiveRecord Associations
  has_many :records
  has_many :users, through: :records 
  has_many :questions
  has_many :answers_received, through: :questions, source: :answers

  # Database validations 
  validates :title, :presence => true 


  def self.title?(title)
    title.empty? 
  end
end
