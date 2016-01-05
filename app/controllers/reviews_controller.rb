class ReviewsController < ApplicationController
  def new
    @piece = Piece.find(params[:piece_id])
    @review = Review.new
  end

  def create
    

  end

  def edit
  end

  def update
  end

end
