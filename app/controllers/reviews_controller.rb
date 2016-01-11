class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]

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
    @review = Review.find(params[:id])
    @piece = Piece.find(params[:piece_id])
    if current_user != @review.user && !current_user.admin
      flash[:notice] = "You can only edit a review you created"
      redirect_to piece_path(@piece)
    end
  end

  def update
    @review = Review.find(params[:id])
    @piece = Piece.find(params[:piece_id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review edited successfully"
      redirect_to piece_path(@piece)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    piece = Piece.find(params[:piece_id])
    review.destroy
    flash[:success] = "Review Deleted"
    redirect_to piece_path(piece)
  end


  private

  def review_params
    params.require(:review).permit(:title, :rating, :body)
  end
end
