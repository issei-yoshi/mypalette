class Admin::UserSessionsController < Admin::BaseController
  layout 'admin/layouts/admin_login'
  skip_before_action :check_admin, only: [:new, :create]
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "adminログイン成功"
      redirect_to admin_colors_path
    else
      flash.now[:danger] = "adminログイン失敗"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "adminログアウト成功"
    redirect_to root_path
  end

end
