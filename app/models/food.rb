class Food < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :user_id, :presense => true
  validates :child_id, :presense => true
end
