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
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to root_path, notice: 'Task was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    
    @task.destroy
    redirect_to tasks_url
  end
end
