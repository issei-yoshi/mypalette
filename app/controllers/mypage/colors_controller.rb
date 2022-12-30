class Mypage::ColorsController < ApplicationController
  layout 'layouts/colorless'

  def palettes
    @palettes = current_user.palettes.includes(:tags).page(params[:page])
  end

  def palette_seconds
    @palette_seconds = current_user.palette_seconds.page(params[:page])
  end

  def likes
    @palettes = current_user.likes_palettes.includes([:user, :likes, :tags]).page(params[:page])
  end
end
