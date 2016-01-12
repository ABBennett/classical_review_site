class Api::V1::ReviewsController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    review = Review.new(review_params)
    if review.save
      render json: :nothing, status: :created, location: api_v1_reviews_path(review)
    else
      render json: :nothing, status: :not_found
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rating, :user_id, :piece_id)
  end
end
