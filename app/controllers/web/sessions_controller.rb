class Web::SessionsController < Web::ApplicationController
  skip_before_filter :authenticate_user!

  def new
    @session = SessionEditType.new
  end

  def create
    @session = SessionEditType.new(params[:session_edit_type])

    user = @session.user
    if @session.valid?
      sign_in(user)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end