class PaletteSecondsController < ApplicationController
  skip_before_action :require_login, only: [:new, :index]
  layout 'layouts/palette_seconds'

  def index
    palette_seconds = if (tag_second_name = params[:tag_second_name])
                        PaletteSecond.with_tag(tag_second_name)
                      else
                        PaletteSecond.all
                      end

    @palette_seconds = palette_seconds.order(created_at: :desc).includes([:tag_seconds, :user, :like_seconds]).order(created_at: :desc).page(params[:page])
    render layout: 'layouts/colorless'
  end

  def show
    @palette_second = PaletteSecond.find(params[:id])
  end

  def new
    @palette_second = PaletteSecond.new
  end

  def create
    @palette_second = current_user.palette_seconds.new(palette_second_params)
    if @palette_second.save
      flash[:success] = "パレットを作成しました"
      redirect_to palette_second_path(@palette_second)
    else
      flash.now[:danger] = "パレット作成に失敗しました"
      render :new
    end
  end

  def destroy
    @palette_second = current_user.palette_seconds.find(params[:id])
    @palette_second.destroy!
    flash[:success] = "パレットを削除しました"
    redirect_to new_palette_second_path
  end

  private

  def palette_second_params
    params.require(:palette_second).permit(:main, :sub, :body, :bg, tag_second_ids: [])
  end
end
