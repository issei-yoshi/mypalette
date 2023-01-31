class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout 'layouts/colorless'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "ログインしました"
      redirect_back_or_to root_path
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end

  def guest_login
    @guest_user = User.create(
      name: 'ゲスト',
      email: SecureRandom.alphanumeric(10) + "@example.com",
      password: 'password',
      password_confirmation: 'password'
    )
    auto_login(@guest_user)
    flash[:success] = 'ゲストとしてログインしました'
    redirect_to root_path
  end
end
