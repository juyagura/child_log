class Child < ActiveRecord::Base

  has_many :baths, :dependent => :destroy
  has_many :diapers, :dependent => :destroy
  has_many :foods, :dependent => :destroy
  has_many :healths, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :sleeps, :dependent => :destroy
  has_many :accomplishments, :dependent => :destroy
  has_many :own_permissions, :dependent => :destroy
  has_many :edit_permissions, :dependent => :destroy
  has_many :view_permissions, :dependent => :destroy

  has_many :owning_users, :through => :own_permissions, :source => :user
  has_many :editing_users, :through => :edit_permissions, :source => :user
  has_many :viewing_users, :through => :view_permissions, :source => :user

  validates :name, :presence => true

end
