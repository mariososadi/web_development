class Answer < ActiveRecord::Base

  # ActiveRecord Associations
  belongs_to :question
  belongs_to :authored_by, class_name: "User", foreign_key: "user_id"

  # Database validations
  validates :title, :presence => true

  # Model methods
  def self.body?(answer)
    answer.empty?
  end

end
