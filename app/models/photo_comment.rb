class PhotoComment < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
  belongs_to :photo

  validates :content, :presense => true
  validates :user_id, :presense => true
  validates :photo_id, :presense => true
end
