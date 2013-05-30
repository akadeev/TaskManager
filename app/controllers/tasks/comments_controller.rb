class Tasks::CommentsController < Tasks::ApplicationController
  def create
    @comment = current_task.comments.build(params[:comment])
    @comment.user = current_user
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