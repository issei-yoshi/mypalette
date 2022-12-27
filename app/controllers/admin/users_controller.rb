class Admin::UsersController < Admin::BaseController
  layout 'admin/layouts/admin_colorless'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy!
    flash[:success] = "削除に成功しました"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
