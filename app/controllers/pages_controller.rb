class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def profile
    @user = current_user
    @paintings = Painting.where(user: current_user)
    @current_requests = Request.where(painting: @user.paintings)
    
  end
end
