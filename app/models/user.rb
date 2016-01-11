class User < ActiveRecord::Base
  has_many :reviews
  has_many :pieces

  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def can_edit_piece?(piece)
    self.admin || self == piece.user
  end

  def can_edit_review?(review)
    self.admin || self == review.user
  end
end
