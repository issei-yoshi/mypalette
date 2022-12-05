class LikesController < ApplicationController
  def create
    palette = Palette.find(params[:palette_id])
    current_user.like(palette)
    redirect_back fallback_location: palette_path(palette)
  end

  def destroy
  end
end
