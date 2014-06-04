class Health < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :description, :presence => true
  validates :user_id, :presence => true
  validates :child_id, :presence => true
end
