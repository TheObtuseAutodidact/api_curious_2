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

  def favorite_tweets
    @favorite_tweets ||= twitter_client.favorites
  end

  def favorite_tweet(tweet_id)
    twitter_client.favorite(tweet_id)
  end

  def post_tweet(tweet)
    twitter_client.update(tweet)
  end

  def total_tweets
    @total_tweets ||= twitter_client.user.statuses_count
  end

  def my_friends
    @my_friends ||= twitter_client.friends.to_a
    #
    # true || false
    # false || true
    # "hello" || true
    # nil || true
    # "" || true
    # User.new || "hello"
  end

  def my_followers
    @my_followers ||= twitter_client.followers.to_a
  end

  def my_timeline
    @my_timeline ||= twitter_client.home_timeline
  end

  def user_timeline(user)
    twitter_client.user_timeline(user)
  end

  private

  def service
    TwitterService.new(self)
  end

  def twitter_client
    @twitter_client ||= service.client
  end



end
