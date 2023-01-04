class Admin::ColorSecondsController < Admin::BaseController
  layout 'admin/layouts/admin_colorless'
  before_action :set_palette, only: [:edit, :update, :destroy]

  def index
    @palette_seconds = PaletteSecond.includes(:user).page(params[:page])
  end

  def show; end

  def edit
    render layout: 'layouts/palette_seconds'
  end

  def update
    if @palette_second.update(palette_params)
      flash[:success] = "カラー編集に成功しました"
      redirect_to admin_colors_path
    else
      flash.now[:danger] = "カラー編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @palette_second.destroy!
    flash[:success] = "カラーを削除しました"
    redirect_to admin_colors_path
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body, :bg, tag_second_ids: [])
  end

  def set_palette
    @palette_second = PaletteSecond.find(params[:id])
  end
end
