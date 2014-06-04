class Photo < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
  has_many :photo_comments, :dependent => :destroy

  validates :image, :presense => true
  validates :user_id, :presense => true
  validates :child_id, :presense => true
end
