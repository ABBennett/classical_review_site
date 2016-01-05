class Review < ActiveRecord::Base
  belongs_to :piece
  belongs_to :user

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: true, format: { with: /[1-9][0]*/ }
  validates :title, length: { maximum: 100 }
  validates :body, length: { minimum: 50, maximum: 5000}
  validates :rank, presence: true, numericality: { only_integer: true }
  
end
