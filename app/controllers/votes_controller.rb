class  VotesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    @vote = Vote.find_or_create_by(user: current_user, review_id: vote_review)
    @vote.update(vote_up_params)
    redirect_to :back
  end

  private

  def vote_review
    params.require(:vote).permit(:review_id).values.first
  end

  def vote_up_params
    params.require(:vote).permit(:up)
  end

end
