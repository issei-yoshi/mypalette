class PalettesController < ApplicationController
  skip_before_action :require_login, only: [:new, :index]

  def index
    palettes = if (tag_name = params[:tag_name])
                 Palette.with_tag(tag_name)
               else
                 Palette.all
               end

    @palettes = palettes.order(created_at: :desc).includes([:tags, :user, :likes]).order(created_at: :desc).page(params[:page])
    render layout: 'layouts/colorless'
  end

  def show
    @palette = Palette.find(params[:id])
  end

  def new
    @palette = Palette.new
  end

  def create
    @palette = current_user.palettes.new(palette_params)
    if @palette.save
      flash[:success] = "パレットを作成しました"
      redirect_to palette_path(@palette)
    else
      flash.now[:danger] = "パレット作成に失敗しました"
      render :new
    end
  end

  def destroy
    @palette = current_user.palettes.find(params[:id])
    @palette.destroy!
    flash[:success] = "パレットを削除しました"
    redirect_to new_palette_path
  end

  private

  def palette_params
    params.require(:palette).permit(:main, :sub, :body, :bgimage, tag_ids: [])
  end
end
