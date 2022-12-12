class Mypage::ProfilesController < ApplicationController
  layout 'layouts/colorless'

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] =  '編集しました'
      redirect_back fallback_location:root_path
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
