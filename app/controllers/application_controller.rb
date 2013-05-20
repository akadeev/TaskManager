class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :log_in_if_needed

  private

  def log_in_if_needed
    unless logged_in?
      redirect_to login_url
    end
  end

  def set_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!set_current_user
  end

  helper_method :set_current_user
end
