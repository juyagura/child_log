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

  validates :username, :presence => true, :uniqueness => true
end
