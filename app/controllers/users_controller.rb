class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_param)
    if @user.save
      render 'static_pages/home'
    else
      render 'users/new'
    end

  end

  def show
  end

  def mypage
    @user = current_user
  end
  private

  def signup_param
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
  end
end
