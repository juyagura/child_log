class Health < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :description, :presense => true
  validates :user_id, :presense => true
  validates :child_id, :presense => true
end
