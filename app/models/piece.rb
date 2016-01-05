class Piece < ActiveRecord::Base
  validates :title, presence: true, uniqueness:
  { scope: :composer, message: "There should only be one title and composer pair" }
  validates :composer, presence: true
end
