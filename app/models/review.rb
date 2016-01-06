class Review < ActiveRecord::Base
  belongs_to :piece
  belongs_to :user

  validates :user_id, presence: { message: "Please sign in to add a review"}
  validates :rating, presence: { message: "Please choose a rating" }
  validates :title, length: {
    minimum: 1,
    maximum: 100,
    too_long: "Titles need to be under 100 characters" },
    allow_blank: true
  validates :body, length: {
    minimum: 50,
    maximum: 5000,
    too_short: "Reviews need to be at least 50 characters",
    too_long: "Reviews need to be under 5000 characters" },
    allow_blank: true
  validates :rank, presence: true, numericality: { only_integer: true }
end
