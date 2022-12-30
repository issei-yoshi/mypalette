class PaletteSecondsController < ApplicationController
  skip_before_action :require_login, only: [:new, :index]
  layout 'layouts/palette_seconds' #暫定対応

  def index
  end

  def show
  end

  def new
    @palette_second = PaletteSecond.new
  end

  def create
    @palette_second = PaletteSecond.new
  end

  def destroy
  end
end
