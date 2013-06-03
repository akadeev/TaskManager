class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  def create
    @comment = current_task.comments.build(params[:comment])
    @comment.user = current_user
    task = @comment.task
    redirect_to task
    if @comment.save
      flash_notice message: t('comment.create.success')
    else
      flash_error message: t('comment.create.error')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    task = @comment.task
    @comment.destroy
    redirect_to task
  end
end