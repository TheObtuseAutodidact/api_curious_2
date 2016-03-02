class UsersController < ApplicationController
  def update
    current_user.post_tweet(params[:tweet])
    redirect_to dashboard_show_path
  end
end
