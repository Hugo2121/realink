class UsersController < ApplicationController
  def index
    redirect_to new_user_path
  end

  def new
    if user_signed_in?
      redirect_to '/' and return
    end

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
