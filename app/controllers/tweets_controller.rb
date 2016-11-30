class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @tweets = Tweet.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @popular = []

    if @tweets.count < 10
      number_of_tweets = @tweets.count
    else
      number_of_tweets = 10
    end

    for i in 1..number_of_tweets
      most_like_tweet = Tweet.new
      @tweets.each do |tweet|
        if tweet.total_likes >= most_like_tweet.total_likes
          most_like_tweet = tweet
        end
      end
      @popular << most_like_tweet
      @tweets = @tweets.without(most_like_tweet)
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @followers = current_user.followers.all

    if @tweet.save
      flash[:success] = "You've tweeted!"

      @followers.each do |follower|
        @follower = User.find_by(id: follower.follower_id)
        @notification = @follower.notifications.build(body: "#{current_user.username} has a new tweet!")
        @notification.save
      end
      
      redirect_to(:back)
    else
      flash[:danger] = @tweet.errors.full_messages
      redirect_to(:back)
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
