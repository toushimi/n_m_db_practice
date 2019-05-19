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
    @user = User.find(params[:id])
  end

  def mypage
    @user = current_user
  end

  def join
    group = Group.find(params[:group][:id])
    current_user.join(group)
    redirect_back fallback_location: mypage_path
  end

  def leave
    group = Group.find(params[:group][:id])
    current_user.leave(group)
    redirect_back fallback_location: mypage_path
  end

  private

  def signup_param
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
  end
end
