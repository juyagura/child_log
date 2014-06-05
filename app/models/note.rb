class Note < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :date, :presence => true
end
