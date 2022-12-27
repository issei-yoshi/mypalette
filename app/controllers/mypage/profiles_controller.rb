class Mypage::ProfilesController < ApplicationController
  layout 'layouts/colorless'
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] =  '編集に成功しました'
      redirect_to mypage_profile_path
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
