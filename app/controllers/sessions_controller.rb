class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_url
    else
      render "login"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end