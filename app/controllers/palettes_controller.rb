class PalettesController < ApplicationController
  def new
    @palettes = Palettes.new
  end

  def show
  end
end
