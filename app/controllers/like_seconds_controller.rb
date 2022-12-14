class LikeSecondsController < ApplicationController
  def create
    palette_second = PaletteSecond.find(params[:palette_second_id])
    current_user.like_second(palette_second)
    redirect_back fallback_location: palette_second_path(palette_second)
  end

  def destroy
    palette_second = current_user.like_seconds_palette_seconds.find(params[:palette_second_id])
    current_user.unlike_second(palette_second)
    redirect_back fallback_location: palette_second_path(palette_second)
  end
end
