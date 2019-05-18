class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user.authenticate(authenticate_param)

    end
  end

  private

  def authenticate_param
    params.require(:user).permit(:email,:nickname,:password)
  end
end
