class User < ActiveRecord::Base
  has_many :reviews
  has_many :pieces
  has_many :votes
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def can_edit?(resource)
    admin || owns?(resource)
  end

  private

  def owns?(resource)
    self == resource.user
  end
end
