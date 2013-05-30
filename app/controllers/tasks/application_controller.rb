class Tasks::ApplicationController < ApplicationController
  def current_task
    Task.find params[:task_id]
  end
end