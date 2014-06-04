class Photo < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
  has_many :photo_comments, :dependent => :destroy

  validates :image, :presence => true
  validates :user_id, :presence => true
  validates :child_id, :presence => true
end
