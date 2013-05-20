class SessionsController < ApplicationController
  skip_before_filter :log_in_if_needed

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render "login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end