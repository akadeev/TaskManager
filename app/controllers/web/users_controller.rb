class Web::UsersController < Web::ApplicationController

  def index
    @users = User.web
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = UserEditType.new
  end

  def edit
    @user = UserEditType.find(params[:id])
  end

  def create
    @user = UserEditType.new(params[:user])
    
    if @user.save
      redirect_to @user
      flash_notice
    else
      render action: "new"
      flash_error
    end
  end

  def update
    @user = UserEditType.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to @user
      flash_notice
    else
      render action: "edit"
      flash_error
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to users_url
  end
end
