class OwnPermission < ActiveRecord::Base
  belongs_to :child
  belongs_to :user
end
