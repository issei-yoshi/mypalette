class PalettesController < ApplicationController
  def new
    @palette = Palette.new
  end

  def create
    @palette = current_user.palettes.new(palette_params)
    if @palette.save
      flash[:success] = "カラー作成成功しました"
      redirect_to root_path
    else
      flash.now[:danger] = "カラー作成失敗しました"
      render :new
    end
  end

  def show
    @palette = Palette.find(params[:id])
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body)
  end
end
