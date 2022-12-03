class Admin::ColorsController < Admin::BaseController
  def index
    @palettes = Palette.all
  end

  def show
  end

  def edit
    @palette = Palette.find(params[:id])
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
  end
end
