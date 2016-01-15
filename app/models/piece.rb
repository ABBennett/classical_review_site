class Piece < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :reviews

  validates :title, presence: true, uniqueness:
  { scope: :composer, message: "There should only be one title and composer pair" }
  validates :composer, presence: true
  validates :user_id, presence: { message: " must be signed in to create a new piece" }
  validates :url, presence: true, format: { with: URI.regexp }

  # def self.title_search(query)
  #   where("title ilike ?", "%#{query}%")
  # end
  #
  # def self.composer_search(query)
  #   where("composer ilike ?", "%#{query}%")
  # end

  include PgSearch
  pg_search_scope :search_by_keywords,
    against: [:title, :composer],
    using: {
      tsearch: {
        prefix: true
      }
    }

  def editable_by?(user)
    self.user == user
  end
end
