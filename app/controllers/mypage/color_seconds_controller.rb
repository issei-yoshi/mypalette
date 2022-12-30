class Mypage::ColorSecondsController < ApplicationController
  layout 'layouts/colorless'

  def palette_seconds
    @palette_seconds = current_user.palette_seconds.page(params[:page])
  end
end
