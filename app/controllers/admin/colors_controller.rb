class Admin::ColorsController < Admin::BaseController
  def index
    @palettes = Palette.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
