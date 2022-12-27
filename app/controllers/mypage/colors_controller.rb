class Mypage::ColorsController < ApplicationController
  layout 'layouts/colorless'

  def index
    @palettes = current_user.palettes.includes(:tags).page(params[:page])
  end

  def likes
    @palettes = current_user.likes_palettes.includes([:user, :likes]).page(params[:page])
  end

end
