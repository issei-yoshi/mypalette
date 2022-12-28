class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    return if current_user&.admin?

    flash[:danger] = '権限がありません'
    redirect_to root_path
  end
end
