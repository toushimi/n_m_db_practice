class SessionsController < ApplicationController
  def new
    redirect_to mypage_path if logged_in?
    @user = User.new
  end

  def create
    user = User.find_by_nickname_or_email(params[:session])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to mypage_path
    else
      flash.now[:danger] = 'ユーザー名・メールアドレス・パスワードが間違っています'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
