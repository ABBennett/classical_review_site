class Piece < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :reviews

  validates :title, presence: true, uniqueness:
  { scope: :composer, message: "There should only be one title and composer pair" }
  validates :composer, presence: true


end
