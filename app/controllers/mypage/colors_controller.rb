class Mypage::ColorsController < ApplicationController
  layout 'layouts/colorless'

  def index
    @palettes = current_user.palettes
  end
end
