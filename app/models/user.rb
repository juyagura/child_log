class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :baths
  has_many :diapers
  has_many :foods
  has_many :healths
  has_many :notes
  has_many :own_photos, :class_name => "Photo", :foreign_key => "user_id"
  has_many :sleeps
  has_many :accomplishments
  has_many :own_permissions
  has_many :edit_permissions
  has_many :view_permissions

  has_many :own_children, :through => :own_permissions, :source => :child
  has_many :editable_children, :through => :edit_permissions, :source => :child
  has_many :viewable_children, :through => :view_permissions, :source => :child

  has_many :viewable_foods, :through => :viewable_children, :source => :foods
  has_many :viewable_sleeps, :through => :viewable_children, :source => :sleeps
  has_many :viewable_diapers, :through => :viewable_children, :source => :diapers
  has_many :viewable_baths, :through => :viewable_children, :source => :baths
  has_many :viewable_healths, :through => :viewable_children, :source => :healths
  has_many :viewable_accomplishments, :through => :viewable_children, :source => :accomplishments
  has_many :viewable_notes, :through => :viewable_children, :source => :notes
  has_many :viewable_photos, :through => :viewable_children, :source => :photos
  has_many :viewable_photo_comments, :through => :viewable_photos, :source => :photo_comments

  has_many :own_permission_controls, :through => :own_children, :source => :own_permissions
  has_many :edit_permission_controls, :through => :own_children, :source => :edit_permissions
  has_many :view_permission_controls, :through => :own_children, :source => :view_permissions

  validates :username, :presence => true, :uniqueness => true
end
