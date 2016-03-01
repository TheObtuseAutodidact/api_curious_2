class User < ActiveRecord::Base
  attr_reader :user

  def self.find_or_create_by_auth(oauth)
    @user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    @user.username = oauth.info.nickname
    @user.image_url = oauth.info.image
    @user.provider = oauth.provider
    @user.name = oauth.info.name
    @user.uid = oauth.uid
    @user.token = oauth.credentials.token
    @user.secret = oauth.credentials.secret
    @user.save
    @user
  end

  def total_tweets
    twitter_client.user.statuses_count
  end

  def my_friends
    twitter_client.friends.to_a
  end

  def my_followers
    twitter_client.followers.to_a
  end

  def my_timeline
    twitter_client.home_timeline
  end

  def user_timeline(user)
    twitter_client.user_timeline(user)
  end


  def service
    @service = TwitterService.new(self)
  end

  def twitter_client
    service.client
  end



end
