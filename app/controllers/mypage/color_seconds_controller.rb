class Mypage::ColorSecondsController < ApplicationController
  layout 'layouts/colorless'

  def palette_seconds
    @palette_seconds = current_user.palette_seconds.order(created_at: :desc).page(params[:page])
  end

  def likes
    @palette_seconds = current_user.like_seconds_palette_seconds.includes([:like_seconds, :tag_seconds]).order(created_at: :desc).includes([:user, :like_seconds]).page(params[:page])
  end
end
