class UserSessionsController < ApplicationController

  def new ; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "ログイン成功しました"
      redirect_back_or_to root_path
    else
      flash.now[:danger] = "ログイン失敗しました"
      render :new
    end
  end

end
