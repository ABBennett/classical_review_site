class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]

  def new
    piece
    @review = Review.new
  end

  def create
    piece
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
    review
    piece
    unless current_user.can_edit_review?(@review)
      flash[:notice] = "You can only edit a review you created"
      redirect_to piece_path(@piece)
    end
  end

  def update
    piece
    if review.update_attributes(review_params)
      flash[:notice] = "Review edited successfully"
      redirect_to piece_path(@piece)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    piece
    review.destroy
    flash[:success] = "Review Deleted"
    redirect_to piece_path(piece)
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :body)
  end

  def review
    @review ||= Review.find(params[:id])
  end

  def piece
    @piece ||= Piece.find(params[:piece_id])
  end
end
