class Answer < ActiveRecord::Base

  validates :body, :presence => true
  
  belongs_to :questions
  belongs_to :authored_by, class_name: "User", foreign_key: "user_id"

    def self.body?(answer)
      answer.empty?
    end
end
