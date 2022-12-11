class Admin::ColorsController < Admin::BaseController
  layout 'admin/layouts/admin_colorless'

  def index
    @palettes = Palette.includes(:user).page(params[:page])
  end

  def show
  end

  def edit
    @palette = Palette.find(params[:id])
    render layout: 'admin/layouts/application'
  end

  def update
    @palette = Palette.find(params[:id])
    if @palette.update(palette_params)
      flash[:success] = "カラー編集に成功しました"
      redirect_to admin_colors_path
    else
      flash.now[:danger] = "カラー編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @palette = Palette.find(params[:id])
    @palette.destroy!
    flash[:success] = "カラーを削除しました"
    redirect_to admin_colors_path
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body)
  end
end
