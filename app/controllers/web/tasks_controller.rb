class Web::TasksController < Web::ApplicationController
  def index
    @search = Task.ransack(params[:q])
    @tasks = @search.result(:distinct => true).page(params[:page]).per(configus.pagination.tasks_per_page)
    @search.build_condition
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    
    if @task.save
      redirect_to @task
      flash_notice message: t('task.create.success')
    else
      render action: "new"
      flash_error message: t('task.create.error')
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to root_path
      flash_notice message: t('task.update.success')
    else
      render action: "edit"
      flash_error message: t('task.update.success')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    
    @task.destroy
    redirect_to tasks_url
  end
end
