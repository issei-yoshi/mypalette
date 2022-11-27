class Admin::UserSessionsController < Admin::BaseController

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "adminログイン成功"
      redirect_to admin_root_path
    else
      flash.now[:danger] = "adminログイン失敗"
      render :new
    end
  end

end