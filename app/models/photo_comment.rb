class PhotoComment < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
  belongs_to :photo

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :photo_id, :presence => true
end
