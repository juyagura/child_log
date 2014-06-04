class Photo < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
  has_many :photo_comments, :dependent => :destroy
end
