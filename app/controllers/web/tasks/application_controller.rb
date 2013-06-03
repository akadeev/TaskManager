class Web::Tasks::ApplicationController < Web::ApplicationController
  include FlashHelper
  def current_task
    Task.find params[:task_id]
  end
end