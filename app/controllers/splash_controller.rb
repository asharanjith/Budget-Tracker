class SplashController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to groups_path
    else
      render :index
    end
  end
end
