class Note < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :content, :presense => true
  validates :user_id, :presense => true
end
