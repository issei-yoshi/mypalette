class ProfilesController < ApplicationController
  def show
    @user = User.find(curret_user.id)
  end
end
