class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    task = @comment.task
    if @comment.save
      redirect_to task, notice: 'Comment was successfully created.'
    else
      redirect_to task
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    task = @comment.task
    @comment.destroy
    redirect_to task
  end
end