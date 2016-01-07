class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def index
    @pieces = Piece.order(:created_at).page(params[:page]).per(10)
  end

  def show
    @piece = Piece.find(params[:id])
    @review = Review.new
    @reviews = @piece.reviews
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])

    if @piece.update_attributes(piece_params)
      flash[:notice] = "Piece edited successfully"
      redirect_to @piece
    else
      flash[:errors] = @piece.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @piece = Piece.new(piece_params)
    @piece.user = current_user
    if @piece.save
      flash[:notice] = "Piece added successfully"
      redirect_to piece_path(@piece)
    else
      flash[:errors] = @piece.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    Piece.find(params[:id]).destroy
    flash[:success] = "Piece Deleted"
    redirect_to root_path
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :composer)
  end
end
