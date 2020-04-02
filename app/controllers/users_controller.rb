class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was successfully created"
      redirect_to user_params(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to user_params(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "User was successfully deleted"
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
