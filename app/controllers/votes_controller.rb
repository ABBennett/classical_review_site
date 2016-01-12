class  VotesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json, :js

  def create
    @review = Review.find(params[:vote][:review_id])
    @piece = @review.piece
    @vote = Vote.find_or_create_by(user_id: current_user.id, review_id: vote_params[:review_id])
    @vote.update(vote_params)
    # respond_to do |format|
      # if @vote.save
      # respond_to js   {
          render json: {
            up: @vote.up,
            review_id: @vote.review_id,
            user_id: @vote.user_id
          }
        # }
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @vote.errors, status: :unprocessable_entity }
      # end
    # end
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :user_id, :up)
  end

  # def vote_review
  #   params.require(:vote).permit(:review_id).values.first
  # end
  #
  # def vote_up_params
  #   params.require(:vote).permit(:up)
  # end

end
