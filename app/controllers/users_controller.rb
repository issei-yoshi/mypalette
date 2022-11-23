class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      flash[:success] =  '成功しました'
      redirect_to root_path
    else
      flash.now[:danger] = '失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
