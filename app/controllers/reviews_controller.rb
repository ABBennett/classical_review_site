class ReviewsController < ApplicationController
  def new
    @piece = Piece.find(params[:piece_id])
    @review = Review.new
  end

  def create
    @piece = Piece.find(params[:piece_id])
    @review = @piece.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Your review has been successfully added.'
      redirect_to piece_path(@piece)
    else
      flash[:notice] = @review.errors.messages.values.join(". ")
      render :'pieces/show'
    end
  end

  def edit
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :body)
  end
end
