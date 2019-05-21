class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_param)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to login_path
    else
      redirect_to new_user_path
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

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(group_param)
    if user.valid?
      user.save
      redirect_to user_path(user.id)
    else
      redirect_to edit_user_path(user.id)
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      redirect_to login_path
    else
      redirect_to root_path
    end
  end

  private

  def signup_param
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
  end
end
