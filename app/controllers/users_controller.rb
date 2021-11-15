class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def index; end

  def new
    @user = User.new
  end

  def show
    @trees = current_user.trees.all.order(:id)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, success: 'User was successfully created.'
    else
      flash.now[:danger] = 'User creation failed.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)  
  end
end
