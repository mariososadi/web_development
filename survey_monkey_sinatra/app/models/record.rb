class Record < ActiveRecord::Base

  # ActiveRecord Associations
  belongs_to :user
  belongs_to :survey

end
