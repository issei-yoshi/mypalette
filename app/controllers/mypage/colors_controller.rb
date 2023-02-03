class Mypage::ColorsController < ApplicationController
  layout 'layouts/colorless'

  def palettes
    @palettes = current_user.palettes.order(created_at: :desc).includes(:tags).page(params[:page])
  end

  def likes
    @palettes = current_user.likes_palettes.includes([:likes, :tags]).page(params[:page])
  end
end
