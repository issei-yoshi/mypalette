class ApplicationController < ActionController::Base
  before_action :require_login

  def not_authenticated
    flash[:danger] = "ログインしてください"
    redirect_to login_path
  end
end
