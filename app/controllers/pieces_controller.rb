class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find(params[:id])
  end

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      flash[:notice] = "Piece added successfully"
      redirect_to new_piece_path
    else
      flash[:errors] = @piece.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :composer)
  end
end
