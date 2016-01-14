class  VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  respond_to :html, :json, :js

  def create
    @vote = Vote.find_or_create_by(user: current_user, review_id: vote_params[:review_id])
    respond_to do |format|
      if @vote.update(vote_params)
        @review = Review.find(params[:vote][:review_id])
        format.html { redirect_to piece_path(@review.piece) }
        format.json   {
            render json: {
              up: @vote.up,
              review_id: @vote.review_id,
            }
        }
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :up)
  end
end
