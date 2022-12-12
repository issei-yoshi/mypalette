class Admin::UsersController < Admin::BaseController
  layout 'admin/layouts/admin_colorless'

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    flash[:success] = "削除に成功しました"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
