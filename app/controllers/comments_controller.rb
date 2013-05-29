class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      redirect_to :back, notice: 'Comment was successfully created.'
    else
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to :back
  end
end