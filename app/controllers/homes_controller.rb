class HomesController < ApplicationController
  skip_before_action :require_login
  layout 'layouts/colorless'

  def about
  end

  def terms
  end

  def policy
  end
end
