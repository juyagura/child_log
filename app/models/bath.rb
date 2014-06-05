class Bath < ActiveRecord::Base

  belongs_to :user
  belongs_to :child

  validates :user_id, :presence => true
  validates :child_id, :presence => true
  validates :date, :presence => true
end
