class ApplicationController < ActionController::Base
  def not_authenticated
    flash[:danger] = "ログインしてください"
    redirect_to login_path
  end
end
