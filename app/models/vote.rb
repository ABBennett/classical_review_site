class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true, uniqueness: { scope: :review_id }
  validates :review_id, presence: true
  validates :up, format: { with: /[01-]/}
end
