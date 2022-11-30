class Mypage::ColorsController < ApplicationController
  def index
    @palettes = current_user.palettes
  end
end
