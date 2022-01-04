class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[new create]
  
  def index; end

  def new
    @user = User.new
  end

  def show
    @trees = current_user.trees.all.order(:id).page(params[:page])
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, success: 'User was successfully created.'
    else
      flash.now[:danger] = 'User creation failed.'
      render :new
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @user.destroy
    redirect_to root_path, success: 'Your account has been deleted.'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)  
  end
end
