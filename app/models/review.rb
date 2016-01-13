class Review < ActiveRecord::Base
  belongs_to :piece
  belongs_to :user
  has_many :votes

  validates :user_id, presence: { message: "Please sign in to add a review"}
  validates :rating, presence: { message: "Please choose a rating" }
  validates :title, length: {
    minimum: 1,
    maximum: 100,
    too_short: "Titles need to be more than 1 character",
    too_long: "Titles need to be under 100 characters" },
    presence: { message: "You wrote a review, but forgot the title."}, if: :body_filled?
  validates :body, length: {
    minimum: 50,
    maximum: 5000,
    too_short: "Reviews need to be at least 50 characters",
    too_long: "Reviews need to be under 5000 characters" },
    presence: { message: "You wrote a title, but forgot the review."}, if: :title_filled?
  validates :rank, presence: true, numericality: { only_integer: true }


  def editable_by?(user)
    self.user == user
  end

  def body_filled?
    !body.empty?
  end

  def title_filled?
    !title.empty?
  end
end
