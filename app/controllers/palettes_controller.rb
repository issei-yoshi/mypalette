class PalettesController < ApplicationController
  skip_before_action :require_login, only: %i[new]

  def new
    @palette = Palette.new
  end

  def create
    @palette = current_user.palettes.new(palette_params)
    if @palette.save
      flash[:success] = "カラー作成成功しました"
      redirect_to palette_path(@palette)
    else
      flash.now[:danger] = "カラー作成失敗しました"
      render :new
    end
  end

  def show
    @palette = Palette.find(params[:id])
  end

  def destroy
    @palette = current_user.palettes.find(params[:id])
    @palette.destroy!
    flash[:success] = "カラー削除成功しました"
    redirect_to new_palette_path
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body)
  end
end
