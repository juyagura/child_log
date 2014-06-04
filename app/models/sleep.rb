class Sleep < ActiveRecord::Base

  belongs_to :user
  belongs_to :child
end
