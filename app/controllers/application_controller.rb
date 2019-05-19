class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:danger] = '先にログインしてください'
      redirect_to login_path
    end
  end
end
