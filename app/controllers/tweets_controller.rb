class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      flash[:success] = "You've tweeted!"
      redirect_to(:back)
    else
      flash.now[:danger] = @tweet.errors.full_messages
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
