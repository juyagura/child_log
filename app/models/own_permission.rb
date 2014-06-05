class OwnPermission < ActiveRecord::Base
  belongs_to :child
  belongs_to :user

  validates :user_id, :presence => true
  validates :child_id, :presence => true, :uniqueness => { :scope => :user_id }

end
