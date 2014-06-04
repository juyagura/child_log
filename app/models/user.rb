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
end
