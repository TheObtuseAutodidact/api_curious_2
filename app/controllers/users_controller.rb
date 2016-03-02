class UsersController < ApplicationController
  def update
    current_user.post_tweet(params[:tweet])
    redirect_to dashboard_show_path
  end

  def favorite
    current_user.favorite_tweet(params[:format]) #format is the status id on the fav'ed tweed
    redirect_to dashboard_show_path
  end
end
