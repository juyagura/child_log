class Child < ActiveRecord::Base

  has_many :baths, :dependent => :destroy
  has_many :diapers, :dependent => :destroy
  has_many :foods, :dependent => :destroy
  has_many :healths, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :sleeps, :dependent => :destroy
  has_many :accomplishments, :dependent => :destroy

  has_many :owning_users, :through => :owners, :source => :user
  has_many :editing_users, :through => :editors, :source => :user
  has_many :viewing_users, :through => :viewers, :source => :user

  validates :name, :presense => true

end
