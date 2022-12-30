class PaletteSecondsController < ApplicationController
  skip_before_action :require_login, only: [:new, :index]
  layout 'layouts/palette_seconds' #暫定対応

  def index
  end

  def show
  end

  def new
    @palette_second = PaletteSecond.new
  end

  def create
    @palette_second = current_user.palette_seconds.new(palette_second_params)
    if @palette_second.save
      flash[:success] = "パレットを作成しました"
      redirect_to palette_seconds_path(@palette_second)
    else
      flash.now[:danger] = "パレット作成に失敗しました"
      render :new
    end
  end

  def destroy
  end

  private

  def palette_second_params
    params.require(:palette_second).permit(:main, :sub, :body, :bg)
  end
end
