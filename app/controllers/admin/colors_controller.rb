class Admin::ColorsController < Admin::BaseController
  layout 'admin/layouts/admin_colorless'
  before_action :set_palette, only: [:edit, :update, :destroy]

  def index
    @palettes = Palette.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show; end

  def edit
    render layout: 'admin/layouts/application'
  end

  def update
    if @palette.update(palette_params)
      flash[:success] = "カラー編集に成功しました"
      redirect_to admin_colors_path
    else
      flash.now[:danger] = "カラー編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @palette.destroy!
    flash[:success] = "カラーを削除しました"
    redirect_to admin_colors_path
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body, :bgimage, tag_ids: [])
  end

  def set_palette
    @palette = Palette.find(params[:id])
  end
end
