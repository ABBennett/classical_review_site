class Piece < ActiveRecord::Base
  paginates_per 10
  validates :title, presence: true, uniqueness:
  { scope: :composer, message: "There should only be one title and composer pair" }
  validates :composer, presence: true


end
